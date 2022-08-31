import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work121/loginPage.dart';
import 'package:work121/pages/image_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<FirebaseFile>> futureFiles;
  @override
  void initState(){
    super.initState();
    futureFiles = FetchImages.listAll('photos/');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: BackButton(color: Colors.white,onPressed: (){},),
      //   title: Text('Previous Photographs'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.logout),
      //       onPressed: () async {
      //         final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      //         sharedPreferences.setString('email',"");
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      //       },
      //     ),
      //   ],
      // ),
      body: FutureBuilder<List<FirebaseFile>>(
        future: futureFiles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return Center(child:  CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Some error occurred'));
              }else {
                final files = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];
                        return buildFile(context, file);
                      },
                    ),
                    ),
                  ],
                );
              }
        }
        },
      )
    );






















  }

  Widget buildFile(BuildContext context, FirebaseFile file) => Card(
    child: ListTile(
      leading: Image.network(
        file.url,
        width: 52,
        height: 52,
        fit: BoxFit.cover,
      ),
      title: Text(
        file.name,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.blue,
        ),
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ImagePage(file : file),
      )),
    ),
  );
}





























class FetchImages{
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
  Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
  static Future<List<FirebaseFile>> listAll(String path) async{
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls.asMap().map((index, url){
      final ref = result.items[index];
      final name = ref.name;
      final file = FirebaseFile(ref: ref, name: name, url: url);

      return MapEntry(index, file);
    }).values.toList();
  }
}

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile({
    required this.ref,
    required this.name,
    required this.url,
});
}