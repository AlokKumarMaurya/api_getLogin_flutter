import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work121/form.dart';
import 'package:work121/loginPage.dart';
import 'package:work121/pages/details.dart';
import 'package:work121/pages/upload_media.dart';
// import 'package:get/get.dart';

var projectId ;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _sample = FirebaseFirestore.instance.
  collection("projectDetails");

 // final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.blue,),
        title: Text("Project List",style: TextStyle(color: Colors.black,fontSize: 30),),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              SharedPreferences sp=await SharedPreferences.getInstance();
              sp.setString("check","No");
              // userdata.write('isLogged', false);
              // userdata.remove('username');
              // Get.offAll(LoginPage());
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.all(12),
          //   child: TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search),
          //   hintText: "Search events here...",border: OutlineInputBorder(),
          //   ),
          //   ),
          // ),
// ElevatedButton(onPressed: ()
//     {
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>Upload())
//       );
//
//
//     }, child:Text("Move")
// )
        Expanded(
        //  flex: 5,
          child: StreamBuilder(stream: _sample.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
                if (streamsnapshot.hasData)
                  {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: streamsnapshot.data!.docs.length,
                        itemBuilder:(context,index)
                        {
                          final DocumentSnapshot documentsnapshot =streamsnapshot.data!.docs[index];
                          return InkWell(
                            child: Card(
                              margin: EdgeInsets.all(10),
                              child:ListTile(
                                // trailing: SizedBox(),
                                title: Text(documentsnapshot["ExecutingAgency"]),
                                subtitle:Column(
                                  children: [
                                    SizedBox(height: 5,),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(documentsnapshot['projectName'])),

                                    SizedBox(height: 5,),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(documentsnapshot['state'])),

                                    SizedBox(height: 5,),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(documentsnapshot['city'])),

                                    SizedBox(height: 5,),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(documentsnapshot['address'])),
                                  ],
                                ),

                              )


                            ),
                            onTap: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context)=>FormPage()));
                              setState(() {
                                projectId = documentsnapshot['projectId'];
                              });
                              debugPrint(projectId);
                            },
                          );

                        }



                    );

                  }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }

            ),
        )
        ],
      ),
    );
  }
}
