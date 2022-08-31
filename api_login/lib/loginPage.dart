import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work121/pages/list_page.dart';

// imort 'package:get_storage/get_storage.dart';
// import 'package:work121/main.dart';
// import 'package:work121/pages/details.dart';
// import 'package:work121/pages/fetch.dart';
// import 'package:work121/pages/list_page.dart';

final _prefs = SharedPreferences.getInstance();

var idid;

var value;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var xx;
  int a = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // final userdata = GetStorage();

  var snpid;
  var pass;

  var idid;

  void login(String email, password) async {
    try {
      Response response = await get(
          Uri.parse(
              'http://mobileapi.work121.com/api/AppLogin/GetMethod?associateID=8709A59B-6B47-4E30-97AC-08793E39C297&associatepwd=m56pth&licenceId=401098&licenceFor=AssetProfiling&AppVersion=1.0&geolocation=0,0&methodname=Getloginuser&AppDateTime=2021-05-04 12:00:00&UserId=0&jsonData={"UserId":"${snpid}","Password":"${pass}",}'),
          // body: {
          //   'UserId' : "SNP37938",
          //   'Password' : "1745148"
          // },
          headers: {
            "username": "uYfVkoP5BDouLkCBZ971sNZhzocdFLhmAvULyvsDnBo=",
            "password": "/I/tmrWuA6AxGV6CiFgD/1AaOcV+2zzhS6OabhGQXVs="
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
         print(data);
        // value = jsonDecode(data["ResponseValue"]);
        // setState(() {
        //   idid = value[0]['DesignationId'];
        // });
        // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        // print(value[0]['DesignationId']);
        // idid = value[0]['DesignationId'];
        // print("idid id ${idid}");
        //
        // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        //
        // print('Login successfully');
        // if (data["ResponseValue"] == "[]") {
        //   print(
        //       "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        //
        //   Fluttertoast.showToast(
        //       msg: "Invalid Credentials",
        //       toastLength: Toast.LENGTH_LONG,
        //       gravity: ToastGravity.SNACKBAR,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       fontSize: 16);
        //
        //   print("aaaaaaaaaaaaaaaaaaaa");
        //   // void showSnackBar(BuildContext context) {
        //   //   final snackBar = SnackBar(content: Text("Invalid Credentials"),
        //   //   backgroundColor: Colors.red,
        //   //     behavior: SnackBarBehavior.floating,
        //   //   );
        //   //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //   // }
        //   final snackbar = SnackBar(content: Text("Invalid Credentials"));
        //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
        //   //  Fluttertoast.showToast(
        //   //     msg: "Invalid Credentials",
        //   //   toastLength: Toast.LENGTH_SHORT,
        //   //   gravity: ToastGravity.BOTTOM,
        //   //   backgroundColor: Colors.red,
        //   //   textColor: Colors.white,
        //   //   fontSize: 16.0,
        //   // );
        // }

        if (data["ResponseValue"] != "[]")
          // if(email != '' && password != ''){
          //   print('Successfull');
          //   userdata.write('isLogged', true);
          //   userdata.write('username', email);
          //
          //   Get.offAll(HomePage());
          //
          // }else{
          //   Get.snackbar('error', 'Please enter valid credential');
          // }
            {
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          sharedPreferences.setString("check", "yes");
          print(sharedPreferences.get("check"));
          Fluttertoast.showToast(
              msg: "Login Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        else
          {

            print(".....................................................................................................");
            Fluttertoast.showToast(
                msg: "Invalid Credentials",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16);
          }
      }
      else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
                alignment: Alignment(0, 0.6),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/121.jpeg")),
                  borderRadius: BorderRadius.circular(12),
                  //border: Border.all(color: Colors.red)
                ),
                child: Text(
                  "Project Monitoring",
                  style: TextStyle(
                      color: Color.fromRGBO(48, 146, 199, 1), fontSize: 13),
                )),
            Container(
              margin: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(12),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "User Id", border: OutlineInputBorder()),
                      onEditingComplete: () {
                        setState(() {
                          snpid = emailController;
                          snpid = snpid.trim();
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          snpid = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(12),
                    child: TextField(
                      controller: passwordController,
                      // obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password", border: OutlineInputBorder()),
                      onChanged: (value) {
                        setState(() {
                          pass = value;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          pass = value;
                          pass = pass.trim();
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final SharedPreferences shared =
                            await SharedPreferences.getInstance();
                        // shared.setBool("login_or_not",true);
                        login(emailController.text.toString(),
                            passwordController.text.toString());
                        print(idid);
                        if (idid != null) {
                          shared.setBool("login_or_not", true);
                          print(
                              "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaa");
                          print(shared.getBool("login_or_not"));
                        }
                      },
                      child: Text("Login"))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/home.jpeg"),
                ),
              ),
            )
          ],
        ));
  }
}
