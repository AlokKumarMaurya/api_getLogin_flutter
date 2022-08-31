import 'dart:io';
// import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work121/loginPage.dart';
import 'package:work121/pages/details.dart';
import 'package:work121/pages/fetch.dart';
import 'package:work121/pages/image_page.dart';
import 'package:work121/pages/list_page.dart';
import 'package:work121/pages/upload_media.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// Random rand = new Random();
// var datetime=DateTime.now();
// Reference ref = FirebaseStorage.instance.ref().
// child("photos").child("/${DateTime.now().toIso8601String()}");


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List<FirebaseFile>> futureFiles;
  @override
  // void initState(){
  //   super.initState();
  //   futureFiles = FetchImages.listAll('photos/');
  // }



  String CurrentLocation = "My Address";
  var CurrentPosition;
var latitude;
var longitude;
   var neededPosition;
  var currentAddress='';
  var speed=0.0;
  var altitude=0.0;
  var administrativeArea=0.0;
  var subadministrativeArea=0.0;
  var postatCode='';
  var subthoroughfare='';
  var throughfare='';
  // var imageURL;


  final photos = FirebaseStorage.instance.ref().child("photos").getDownloadURL();


  // @override
  // void dispose()
  // {
  //   _remarkController.dispose();
  //   super.dispose();
  //
  // }


var position;
  File? image;
  Storage _storage = new Storage();

  //var _remarkController = TextEditingController();
  CollectionReference projectStepUploadedMedia = FirebaseFirestore.instance.collection
    ("projectStepUploadedMedia");


  late String Remark;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Upload Media'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString('email',"");
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              child:

              // image!=null ? Image.file(image!,width:MediaQuery.of(context).size.width,height:300,):
              Container(
               // decoration: BoxDecoration(image:DecorationImage(image: NetworkImage("")),
                    color: Colors.grey.shade100,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child:image!=null ? Image.file(image!,width:MediaQuery.of(context).size.width,height:300,fit: BoxFit.cover,): Icon(Icons.camera_alt_outlined,size: 60,),

                  // child: image == null
                  //     ? Icon(
                  //   Icons.image,
                  //   size: 50,
                  // )
                  //     : Image.file(
                  //   image!,
                  //   fit: BoxFit.fill,
                  // )



      ),

              // onTap: ()async
              // { determinePositon();
              //
              //   _storage.getImage(context).then((file) async{
              //     setState(() {
              //       image = (File(file.path));
              //     // firebase_storage.UploadTask task = firebase_storage.Reference.putFile(file);
              //       print(file.path);
              //     });
              //
              //     if (image != null) {
              //
              //       _storage.uploadFile(image!, context);
              //       // await ref.putFile(File(aa));
              //       // imageURL = await ref.getDownloadURL();
              //     }
              //     else
              //       ScaffoldMessenger.of(context).showSnackBar(
              //           SnackBar(content: Text("No Image was selected")));
              //   });
              //
              // },


            ),















            ElevatedButton(onPressed:(){

              determinePositon();

              _storage.getImage(context).then((file) async{
                setState(() {
                  image = (File(file.path));
                  // firebase_storage.UploadTask task = firebase_storage.Reference.putFile(file);
                  print(file.path);
                });

                if (image != null) {

                  _storage.uploadFile(image!, context);
                  // await ref.putFile(File(aa));
                  // imageURL = await ref.getDownloadURL();
                }
                else
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("No Image was selected")));
              }
              );


            } , child:Text("Click Photo")),










            Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),),
              child: TextField(
                //controller: _remarkController,
                decoration: InputDecoration(hintText: "Remark",border:OutlineInputBorder
                  (borderRadius: BorderRadius.circular(12))),
                onChanged: (value){
                  Remark = value;
                },

              ),

            ),

SizedBox(height: 10,),
            // Container(
            //   margin: EdgeInsets.all(12),
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),),
            //   child: TextField(
            //     decoration: InputDecoration(hintText: "Court Name",border:OutlineInputBorder
            //       (borderRadius: BorderRadius.circular(12))),
            //   ),
            // ),




            Container(
                width: MediaQuery.of(context).size.width/2,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(onPressed: ()async{
                  await projectStepUploadedMedia.add(
                    {
                      "DesignationId":"1",
                      "geolocation":GeoPoint(latitude, longitude),
                      //determinePositon(),
                      "imagePath":imageURL,
                      "mediaId":"",
                      "projectId":projectId,
                      "remark":Remark,
                      "stepId":stepId,
                      "uploadtime":DateTime.now(),

                    }
                  ).then((value) { print("User added");
                  // ScaffoldMessenger(child: Text("Remark Uploaded successfully"));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have successfully submitted")));
                  } );
                  debugPrint(photos.toString());

                  setState(() {
                    futureFiles = FetchImages.listAll('photos/');
                  });

                },
                    child: Text("Submit",
                      style: TextStyle(color: Colors.white),

                    ),


                )
            ),
            // ElevatedButton(onPressed:determinePositon,
            //
            //
            //
            //
            //     child:Text("Location"))
            // Expanded(
            //   flex: 20,
            //   child: FutureBuilder<List<FirebaseFile>>(
            //     future: futureFiles,
            //     builder: (context, snapshot) {
            //       switch (snapshot.connectionState) {
            //         case ConnectionState.waiting: return Center(child:  CircularProgressIndicator());
            //         default:
            //           if (snapshot.hasError) {
            //             return Center(child: Text('Some error occurred'));
            //           }else {
            //             final files = snapshot.data!;
            //             return Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Expanded(
            //                   child: ListView.builder(
            //                     itemCount: files.length,
            //                     itemBuilder: (context, index) {
            //                       final file = files[index];
            //                       return buildFile(context, file);
            //                     },
            //                   ),
            //                 ),
            //               ],
            //             );
            //           }
            //       }
            //     },
            //   ),
            // ),
SizedBox(height: 20,),

            Container( width: MediaQuery.of(context).size.width/2,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>MainPage()));}
                  , child: Text("Previous Photographs")),
            )


          ],
        ),
      ),
    );
  }


Future<Position> determinePositon() async {
  bool serviceEnabled;
  LocationPermission permission;


  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Fluttertoast.showToast(msg: "Please enable location");
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.denied) {
    Fluttertoast.showToast(msg: "Location permission denied");
  }

  if (permission == LocationPermission.deniedForever) {
    Fluttertoast.showToast(msg: "Permission is denied forever");
  }
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
  );

  /////////////////////
  speed=await position.speed;
  altitude=await position.altitude;
  if(speed !=speed)
  {
    setState(()
    {
      speed=speed;
    }
    );
  }

  ////?????
  try {
    List<Placemark> placemark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark place = placemark[0];
    setState(() {
latitude=position.latitude;
longitude=position.longitude;
      altitude=altitude;
      CurrentPosition =[position.longitude , position.latitude];
      currentAddress="(${place.locality},${place.country},"
          "${place.street},${place.name},${place.administrativeArea},"
          "${place.subAdministrativeArea},${place.postalCode},${place
          .postalCode},${place.subThoroughfare},${place.thoroughfare})";

    }
    );
  }
  catch(e)
  {
    print(e);
  }
  return position;
}





  Widget buildFile(BuildContext context, FirebaseFile file) => Card(
    child: ListTile(
      leading:
      // ClipOval(
      // child:
      Image.network(
        file.url,
        width: 52,
        height: 52,
        fit: BoxFit.cover,
      ),
      //),
      title: Text(
        file.name,
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 10,
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






