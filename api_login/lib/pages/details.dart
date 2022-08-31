import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work121/loginPage.dart';
import 'package:work121/pages/upload_media.dart';

import 'new_page.dart';
var stepId;


class ProjectDetails extends StatefulWidget {
  const ProjectDetails({Key? key}) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  var testData ;
  final CollectionReference _projectSteps = FirebaseFirestore.instance.collection("projectSteps");
  final CollectionReference _projectDetails = FirebaseFirestore.instance.collection("projectDetails");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Details",style: TextStyle(color: Colors.black,fontSize: 30),),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
      onPressed: () async {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("email","");
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
          )],
      ),
      body: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.all(12),
          //   child: TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search),
          //     hintText: "Search events here...",border: OutlineInputBorder(),
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
        //fn(),
          StreamBuilder(
              stream: _projectSteps.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
                if (streamsnapshot.hasData)
                {return SingleChildScrollView(
                    child: Container(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: streamsnapshot.data!.docs.length,
                          itemBuilder:(context,index)
                          {final DocumentSnapshot documentsnapshot =streamsnapshot.data!.docs[index];
                            return InkWell(
                              child: Card(
                                  margin: EdgeInsets.all(10),
                                  child:ListTile(

                                    title:Text(documentsnapshot['stepName']),
                                    subtitle: Text(documentsnapshot["stepDetails"]),

                                  )
                              ),
                              onTap: ()
                              {
                                // setState(() {
                                //   testData=documentsnapshot["stepDetails"];
                                // });
                              //   var a = _projectDetails.snapshots();
                              //  AsyncSnapshot<QuerySnapshot > ? bb;
                              //  // var c=bb?.data!.docs[index];
                              // final DocumentSnapshot c =a!.data!.docs[index][0];
                              //   debugPrint(c);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                                debugPrint(testData);

                                setState(() {
                                  stepId=documentsnapshot["stepId"];
                                });
                              },
                            );

                          }



                      ),
                    ),
                  );

                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }

          ),














          //
          // StreamBuilder(
          //     stream: _projectDetails.snapshots(),
          //     builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
          //       if (streamsnapshot.hasData)
          //       {
          //         //final DocumentSnapshot documentsnapshot = streamsnapshot.data!.docs[index];
          //         final DocumentSnapshot documentsnapshot =streamsnapshot.data!.docs[0];
          //         setState(() {
          //           testData=documentsnapshot["projectId"];
          //         });

                  // setState(() {
                  //   streamsnapshot.data!.docs[index][""];
                //   // });
                //   return SingleChildScrollView(
                //   child: Container(
                //     child: ListView.builder(
                //         scrollDirection: Axis.vertical, shrinkWrap: true, itemCount: streamsnapshot.data!.docs.length, itemBuilder:(context,index)
                //     {final DocumentSnapshot documentsnapshot =streamsnapshot.data!.docs[index];
                //       setState(() {
                //         testData=documentsnapshot["projectId"];
                //       });
                //     return InkWell(
                //       child: Card(
                //           margin: EdgeInsets.all(10),
                //           child:ListTile(
                //
                //             title:Text(documentsnapshot['stepName']),
                //             subtitle: Text(documentsnapshot["stepDetails"]),
                //
                //           )
                //       ),
                //       onTap: ()
                //       {
                //
                //         //   var a = _projectDetails.snapshots();
                //         //  AsyncSnapshot<QuerySnapshot > ? bb;
                //         //  // var c=bb?.data!.docs[index];
                //         // final DocumentSnapshot c =a!.data!.docs[index][0];
                //         //   debugPrint(c);
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                //         debugPrint(testData);
                //       },
                //     );
                //
                //     }
                //
                //
                //
                //     ),
                //   ),
                // );
          //
          //       }
          //
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //
          // )





















        ],
      ),
    );
  }



Widget fn()
{
  return StreamBuilder(
      stream: _projectDetails.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
        if (streamsnapshot.hasData)
        {
          //final DocumentSnapshot documentsnapshot = streamsnapshot.data!.docs[index];
          final DocumentSnapshot documentsnapshot =streamsnapshot.data!.docs[0];
          setState(() {
            testData=documentsnapshot["projectId"];
          });
          return Center(
            child: CircularProgressIndicator(),
          );
         // return testData;

          // setState(() {
          //   streamsnapshot.data!.docs[index][""];
          //   // });
          //   return SingleChildScrollView(
          //   child: Container(
          //     child: ListView.builder(
          //         scrollDirection: Axis.vertical, shrinkWrap: true, itemCount: streamsnapshot.data!.docs.length, itemBuilder:(context,index)
          //     {final DocumentSnapshot documentsnapshot =streamsnapshot.data!.docs[index];
          //       setState(() {
          //         testData=documentsnapshot["projectId"];
          //       });
          //     return InkWell(
          //       child: Card(
          //           margin: EdgeInsets.all(10),
          //           child:ListTile(
          //
          //             title:Text(documentsnapshot['stepName']),
          //             subtitle: Text(documentsnapshot["stepDetails"]),
          //
          //           )
          //       ),
          //       onTap: ()
          //       {
          //
          //         //   var a = _projectDetails.snapshots();
          //         //  AsyncSnapshot<QuerySnapshot > ? bb;
          //         //  // var c=bb?.data!.docs[index];
          //         // final DocumentSnapshot c =a!.data!.docs[index][0];
          //         //   debugPrint(c);
          //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          //         debugPrint(testData);
          //       },
          //     );
          //
          //     }
          //
          //
          //
          //     ),
          //   ),
          // );

        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }

  );


}





}
