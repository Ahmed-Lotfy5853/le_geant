import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:le_geant/customcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'profilescreen.dart';
var de;

class CodeScreen extends StatefulWidget {

   CodeScreen({Key? key}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  TextEditingController CodeController = TextEditingController();

var k = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:16.5),
              Image.asset('assets/Logo.png',scale: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                   width: 240,


                  child: Form(
                    key: k,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: CodeController,
                      validator: (txt){
                        if(txt!.isEmpty){
                          return "الحقل لا يجب أن يكون فارغاً";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "كود الطالب",

                          hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(color: Color(0xff000000),fontSize: 20,                      fontFamily: 'cairo',
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xfff2c668))),
                        //label: Text("Enter Code",style: TextStyle(color: Color(0xff000000)),),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff2c668)),
                          borderRadius: BorderRadius.horizontal(   left: Radius.circular(40),
                              right: Radius.circular(40)),
                        )
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              MaterialButton(
                  onPressed: ()async{
                    if(k.currentState!.validate()){
                      try {
                        final result = await InternetAddress.lookup('example.com');
                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                          print('connected');
                          var response = await http.post(Uri.parse("https://almonofey.com/api/register?userName=${CodeController.text}"));
                          print(response.statusCode);
                          if(response.statusCode ==200){

                            print(jsonDecode(response.body));
                            de = jsonDecode(response.body);
                            if(de["success"]) {
                              Fluttertoast.showToast(msg: "نجح تسجيل الدخول",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,backgroundColor: myColor.shade200,        textColor: Colors.black,
                                  fontSize: 16.0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
                            }
                            else
                              Fluttertoast.showToast(msg: "فشل تسجيل الدخول",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,backgroundColor: myColor.shade200,        textColor: Colors.black,
                                  fontSize: 16.0);
                          }

                        }
                      } on SocketException catch (_) {
                        Fluttertoast.showToast(msg: "يرجى الإتصال بالإنترنت",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,backgroundColor: myColor.shade200,        textColor: Colors.black,
                            fontSize: 16.0);
                        print('not connected');
                      }



                      }
                  },
                  child: Container(
                    width:240 ,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff000000),
                        borderRadius: BorderRadiusDirectional.horizontal(
                            start: Radius.circular(40),
                            end: Radius.circular(40))),
                    child: Text(
                      "بيانات الطالب",
                      style: TextStyle(
                        color: Color(0xfff2c668),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cairo',


                      ),
                    ),
                  )),
              SizedBox(height: 20,),
              // Divider(
              //   height: 20,
              //   color: Color(0xfff2c668),
              //   indent: 20,
              //   endIndent: 20,
              //   thickness: 2,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Text("تواصل معنا",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cairo',


                  ),),
              ),
              // Divider(
              //   height: 20,
              //   color: Color(0xfff2c668),
              //   indent: 20,
              //   endIndent: 20,
              //   thickness: 2,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 5,bottom: 5,right: 21),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: IconButton(
                        onPressed: ()async{
                          await launchUrl(Uri.parse('https://www.youtube.com/channel/UCnIY1o6duzYNAP-lOxGJxig'));
                        },
                        icon: SvgPicture.asset('assets/icons8-youtube.svg'
                          ,width: 30,height:30,
                          color: Color(0xfff2c668),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: IconButton(
                        onPressed: ()async{
                          await launchUrl(Uri.parse('almonofy11@gmail.com'));
                        },
                        icon: SvgPicture.asset('assets/g.svg'
                          ,width: 30,height:30,
                          color: Color(0xfff2c668),
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.black,

                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: IconButton(
                        onPressed: ()async{
                          await launchUrl(Uri.parse('https://api.whatsapp.com/send?phone=01501686888&amp;app=facebook&amp;entry_point=page_cta'));
                        },
                        icon: SvgPicture.asset('assets/icons8-whatsapp.svg'
                          ,width: 30,height:30,
                          color: Color(0xfff2c668),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 21, top: 5,bottom: 5,right: 5 ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.black,

                        ),
                      ),
                      child: IconButton(
                        onPressed: ()async{
                          await launchUrl(Uri.parse('https://www.facebook.com/LeGeant11'));
                        },
                        icon: SvgPicture.asset('assets/f.svg'
                          ,width: 30,height:30,
                          color: Color(0xfff2c668),
                        ),
                      )),
                ],
              ),
              SizedBox(height:16.5),


            ],
          ),
        ),
      ),
    );
  }
}
//