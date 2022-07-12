import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';

import 'codescreen.dart';

String url = 'https://elmonofey.com/home';
class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
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
              Image.asset('assets/Logo.png',scale: 8,),
              MaterialButton(
                  onPressed: ()async{
                    await launchUrl(Uri.parse(url));
                  },
                  child: Container(
                    //height: 120,
                    width: 240,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff000000),
                        borderRadius: BorderRadiusDirectional.horizontal(
                            start: Radius.circular(40),
                            end: Radius.circular(40))),
                    child: Text(
                      "الدخول للموقع",
                      style: TextStyle(
                        color: Color(0xfff2c668),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cairo',

                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeScreen()));
                  },
                  child: Container(
                    width: 240,
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
                ],


          ),
        ),
      ),
    );
  }
}
//الدخول للموقع
//الحصول على بيانات الطالب
//الكوفي
//كايرو
//f g whats youtube