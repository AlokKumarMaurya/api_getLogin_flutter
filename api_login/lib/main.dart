import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:work121/loginPage.dart';
import 'package:work121/pages/fetch.dart';
import 'package:work121/pages/list_page.dart';

var valid=false;

void main() async{



  // await GetStorage.init();
  // final SharedPreferences shared=await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sp=await SharedPreferences.getInstance();
  var aa=sp.getString("check");
  print(aa);
  print("value in main.drat");
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home:(aa=="yes")?HomePage(): LoginPage()
  ));
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//
//   Future getValidationData()async
//   {
//     final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
//     var obtainedData=sharedPreferences.getBool("login_or_not");
//     valid=obtainedData!;
//     print("VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
//     print(valid);
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "home",
//       home://(llooggiinn==0)?HomePage():LoginPage(),
//       // LoginPage(),
//       (valid)?HomePage():LoginPage(),
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//     );
//   }
// }


// class Testing extends StatefulWidget {
//   const Testing({Key? key}) : super(key: key);
//
//   @override
//   State<Testing> createState() => _TestingState();
// }
//
// class _TestingState extends State<Testing> {
//
//   final userdata =  GetStorage();
//
//   @override
//   void initState(){
//     //TODO: implement initState
//     super.initState();
//
//     userdata.writeIfNull('isLogged', false);
//
//     Future.delayed(Duration.zero, () async{
//       checkiflogged();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   void checkiflogged() {
//     userdata.read('isLogged') ? Get.offAll(HomePage()) : Get.offAll(LoginPage());
//   }
// }
