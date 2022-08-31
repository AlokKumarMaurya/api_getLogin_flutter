import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:work121/loginPage.dart';
import 'package:work121/pages/fetch.dart';
import 'package:work121/pages/upload_media.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  CollectionReference Form_Data =
      FirebaseFirestore.instance.collection("Form_Data_of_id");

  // TextEditingController first = TextEditingController();
  // TextEditingController second = TextEditingController();
  // TextEditingController third = TextEditingController();
  // TextEditingController fourth = TextEditingController();
  // TextEditingController description = TextEditingController();


  var first ;
  var  second ;
  var third ;
  var fourth ;
  var description ;





  var one, two, three, four, five;

  // Position<Future> pos=determinePositon();
  var long;
  var lat;
  var iteamList = [
    "Government order",
    "T.S. Estimate",
    "Letter Of Award",
    "Agreement",
    "Agreement",
    "Pie/Bar Chart",
    "Utilization Certificate",
    "Completion Certificate",
    "Site Photograph",
    "Other Files"
  ];

  var filetype = "Select file type";
  var todays_date = DateTime.now();
  var dateInput;
  var choosen_date;
  var selectedValue;
  var dropdownvalue;

  File? image;
  Storage storage = new Storage();
  @override
  void initState() {
    determinePositon();
    super.initState();
    print("idid is ${idid}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(12),
              child: TextFormField(
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter the correct value";
                  }
                },
onChanged: (value)
                {
                  setState(() {
                    first=value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "वित्तीय प्रगति (लाख में)",
                  hintText: "वित्तीय प्रगति (लाख में)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(12),
              child: TextFormField(
                onChanged: (value)
                {
                  setState(() {
                    second=value;
                  });
                },
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter the correct value";
                  }
                },

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "भौतिक प्रगति %",
                    hintText: "भौतिक प्रगति %",
                    border: OutlineInputBorder()),
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(12),
              child: TextFormField(
onChanged: (value)
                {
                  setState(() {
                    third=value;
                  });
                },
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter the correct value";
                  }
                },

                decoration: InputDecoration(
                    labelText: "अभ्युक्ति",
                    hintText: "अभ्युक्ति",
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () async{




  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if(    first != null || second != null || third != null || lat!=null || long!=null )
  {
    // await Form_Data.add({
    //   "वित्तीय प्रगति (लाख में)":first,
    //   "भौतिक प्रगति %":second,
    //   "अभ्युक्ति":third,
    //   "location":GeoPoint(lat,long)
    // });


    Fluttertoast.showToast(
        msg: "details uploaded",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16);



  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






                  print(first);
                  print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                  if (first == null ||
                      second == null ||
                      third == null ) {
                    if(lat==null || long==null)
                      {
print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");


                        Fluttertoast.showToast(
                            msg: "please enable the location",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16);
                      }
                    Fluttertoast.showToast(
                        msg: "please enter the correct details",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16);

                    // const snackBar = SnackBar(
                    //     content: Text("Pls enter all the data correctly"));
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>FormPage()));
                },
                child: Text("Update")),

            Row(
              children: [
                (long != null && lat != null)
                    ? Text("   latitude:${lat} / longitude:${long}")
                    : Text("Current location")
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              color: Colors.white,
              margin: EdgeInsets.all(12),
              child: TextFormField(
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter the correct value";
                  }
                },
onChanged: (value)
                {
                  setState(() {
                    fourth=value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "अवमुक्त धनराशी",
                    hintText: "अवमुक्त धनराशी",
                    border: OutlineInputBorder()),
              ),
            ),

            ElevatedButton(
              onPressed: ()async {

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                if(fourth!=null && lat!=null && long!=null )
                  {
                    // await Form_Data.add({
                    //   "अवमुक्त धनराशी":fourth
                    // });

                    Fluttertoast.showToast(
                        msg: "अवमुक्त धनराशी uploaded ",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16);

                  }
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                if(fourth==null)
                  {
                    if(lat==null || long==null)
                    {
                      Fluttertoast.showToast(
                          msg: "please enable the location",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16);



                    }

                    Fluttertoast.showToast(
                        msg: "please enter the correct amount",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16);
                  }
                // Navigator.push(context,MaterialPageRoute(builder: (context)=>FormPage()));
              },
              child: Text("Add Released Amount"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // height: 340,
              width: 350,
              // child: Padding(
              //   padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              //   child: Text("Upload Files", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              // ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),

                  //BoxShadow
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Column(
                  children: [
                    Text(
                      "Upload Files",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Text(filetype),
                              Padding(
                                padding: const EdgeInsets.only(left:0.0),
                                child:
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    items: iteamList.map((iteam) => DropdownMenuItem(
                                              value: iteam,
                                              child: Text(
                                                iteam,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    dropdownDecoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(12)),
                                    // buttonPadding: EdgeInsets.only(right: 50),
                                    dropdownPadding: EdgeInsets.only(
                                        left: 0, right: 100, top: 15),
                                    buttonWidth:300 ,
                                    // itemHeight: 100,
                                    buttonHeight: 30,
                                    dropdownMaxHeight: 300,
                                    dropdownElevation: 10,
                                    dropdownWidth: 330,
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        filetype = value.toString();
                                      });
                                      switch (value) {

                                        // case "Pay Online" : Navigator.push(context, MaterialPageRoute(builder: (context)=>Qr()));
                                        // break;
                                        //
                                        // case "Pay Offline" : Navigator.push(context,MaterialPageRoute(builder: (context)=>Pay()));
                                        // break;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:0.0),
                                child:
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    items: iteamList.map((iteam) => DropdownMenuItem(
                                      value: iteam,
                                      child: Text(
                                        iteam,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                        .toList(),
                                    dropdownDecoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(12)),
                                    // buttonPadding: EdgeInsets.only(right: 50),
                                    dropdownPadding: EdgeInsets.only(
                                        left: 0, right: 100, top: 15),
                                    buttonWidth:300 ,
                                    // itemHeight: 100,
                                    buttonHeight: 30,
                                    dropdownMaxHeight: 300,
                                    dropdownElevation: 10,
                                    dropdownWidth: 330,
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        filetype = value.toString();
                                      });
                                      switch (value) {

                                      // case "Pay Online" : Navigator.push(context, MaterialPageRoute(builder: (context)=>Qr()));
                                      // break;
                                      //
                                      // case "Pay Offline" : Navigator.push(context,MaterialPageRoute(builder: (context)=>Pay()));
                                      // break;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.all(12),
                      child: TextFormField(
                        validator: (value) {


                          if (value == null || value.isEmpty) {
                            return "Please enter the correct value";
                          }
                        },
                        onChanged: (value)
                        {
                          description=value;
                        },

                        //readOnly: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "File Description",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    // Container(
                    //   color: Colors.white,
                    //   margin: EdgeInsets.all(12),
                    //   child: TextField(
                    //     readOnly: true,
                    //     decoration: InputDecoration(hintText: "Pick the date",border:
                    //     OutlineInputBorder()),
                    //   ),
                    // ),

                    Container(
                        padding: EdgeInsets.all(15),
                        height: MediaQuery.of(context).size.width / 5,
                        child: Center(
                            child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                height: 50,
                                // width: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26)),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_month),
                                    (choosen_date != null)
                                        ? Text(choosen_date)
                                        : Text("Choose the date"),
                                  ],
                                ),
                              ),
                              // Container(width: MediaQuery.of(context).size.width/2,)
                            ],
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime.now());

                            if (pickedDate != null) {
                              print(pickedDate);
                              setState(() {
                                choosen_date = pickedDate;
                              }); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                choosen_date = formattedDate;
                                dateInput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ))),

                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: ElevatedButton(
                        onPressed: () {
                          storage.getImage(context).then((file) async {
                            setState(() {
                              image = (File(file.path));
                              print(file.path);
                            });
                            if (image != null) {
                              storage.uploadFile(image!, context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Please select image")));
                            }
                          });
                        },
                        child: Text("Choose file"),
                      ),
                    ),
SizedBox(height: 30,),
                    ElevatedButton(onPressed: ()async{

                      if(lat!=null && long != null && description!=null && filetype!="Select file type" && choosen_date!=null &&    first != null && second != null && third != null  && fourth!=null)
                        {
                          Form_Data.add({
                            "file type":filetype,
                            "description":description,
                            "date":choosen_date,
                            "अवमुक्त धनराशी":fourth,
                            "वित्तीय प्रगति (लाख में)":first,
                            "भौतिक प्रगति %":second,
                            "अभ्युक्ति":third,
                            "location":GeoPoint(lat,long)
                          });



                          Fluttertoast.showToast(
                              msg: "details uploaded successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.SNACKBAR,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16);

                        }


                      if(lat==null || long==null)
                      {
                        Fluttertoast.showToast(
                            msg: "please enable the location",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16);
                      }
                     else if(description==null)
                        {
                          Fluttertoast.showToast(
                              msg: "please enter the discription",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.SNACKBAR,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16);
                        }
                     else  if(filetype=="Select file type")
                        {
                          Fluttertoast.showToast(
                              msg: "please select the file type",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.SNACKBAR,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16);
                        }
                     else if(choosen_date==null)
                        {
                          Fluttertoast.showToast(
                              msg: "please select the date",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.SNACKBAR,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16);
                        }


                     // if(choosen_date==null && filetype=="Select file type" && description==null && lat==null || long==null)
                     //   {
                     //
                     //   }


                    }, child:Text("Upload file"))
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //FETCH IMAGES START HERE
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Uploaded Files",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  color: Colors.black26,
                  child: MainPage(),
                ),
              ),
            ),

            // MainPage()
          ],
        ),
      ),
    );
  }

  //

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
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      long = position.longitude;
      lat = position.latitude;
    });

    var speed = await position.speed;
    if (speed != null) {}

    /////////////////////
    // speed=await position.speed;
    // altitude=await position.altitude;
    // if(speed !=speed)
    // {
    //   setState(()
    //   {
    //     speed=speed;
    //   }
    //   );
    // }

    ////?????
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemark[0];
      // setState(() {
      //   latitude=position.latitude;
      //   longitude=position.longitude;
      //   altitude=altitude;
      //   CurrentPosition =[position.longitude , position.latitude];
      //   currentAddress="(${place.locality},${place.country},"
      //       "${place.street},${place.name},${place.administrativeArea},"
      //       "${place.subAdministrativeArea},${place.postalCode},${place
      //       .postalCode},${place.subThoroughfare},${place.thoroughfare})";
      //
      // }

    } catch (e) {
      print(e);
    }
    return position;
  }

  fn() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      duration: Duration(minutes: 1),
      content: Container(
          height: 100,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [Icon(Icons.camera_alt), Text("Camera")],
                )),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [Icon(Icons.photo), Text("Gallery")],
              ),
            ),
          ])),
    ));
  }

  imagePickerPotion() {
    BottomAppBar(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [Icon(Icons.camera_alt), Text("Camera")],
              )),
          ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [Icon(Icons.photo), Text("Gallery")],
              )),
        ],
      ),
    );
  }
}
