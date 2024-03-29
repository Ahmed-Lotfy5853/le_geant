
import 'package:flutter/material.dart';

import 'codescreen.dart';
import 'mainscreen.dart';
import 'models.dart';
// int index=0;
class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
//#2596be
//f27f23
class _ProfileScreenState extends State<ProfileScreen> {
  Color primary = Color(0xfff2c668);
// List<Exam> Exams = [];

// List<Practice> Practices = [];
//
// List<Attendance> Attendances = [];
//
// List<Hidden> Hiddens = [];
  Exam fi = Exam();
  Exam ex = Exam();
  Exam att = Exam();
  Exam part = Exam();
  Exam hidd = Exam();

  @override
  void initState() {
// Exams.addAll(iterable)
// print(de["data"][0]["full_exam"].length);
// print("gogoogogogoogogogo${de["data"][0]["exercices"].isNotEmpty}");
    if(de["data"][0]["exercices"].isNotEmpty)
      for(int i =0; i < de["data"][0]["exercices"].length;i++){
        ex.DatRow.add(DataRow(cells: [
          DataCell(Container(width:77,child: Text(de["data"][0]["exercices"][i]["exam"]["exam_name"],softWrap: true,overflow: TextOverflow.visible,))),
          DataCell(Container(width:75,child: Text(de["data"][0]["exercices"][i]["exam"]["time_ago"],softWrap: true,overflow: TextOverflow.visible,))),
          DataCell(Text(de["data"][0]["exercices"][i]["mark"].toString())),
          DataCell(Text(de["data"][0]["exercices"][i]["fullmark"].toString())),
        ]));

        /*fi.Date.add(de["data"][0]["full_exam"][i]["exam"]["time_ago"]);
  fi.Degree.add(de["data"][0]["full_exam"][i]["mark"].toString());
fi.FinalDegree.add(de["data"][0]["full_exam"][i]["fullmark"].toString());*/
      }

//   print("empty");

// print(de["data"][0]["full_exam"][0]["exam"]["exam_name"]??"");
    if(de["data"][0]["full_exam"].isNotEmpty)
      for(int i =0; i < de["data"][0]["full_exam"].length;i++){
        fi.DatRow.add(DataRow(cells: [
          DataCell(Container(width:77,child: Text(de["data"][0]["full_exam"][i]["exam"]["exam_name"],softWrap: true,overflow: TextOverflow.visible,))),
          DataCell(Container(width:75,child: Text(de["data"][0]["full_exam"][i]["exam"]["time_ago"],softWrap: true,overflow: TextOverflow.visible,))),
          DataCell(Text(de["data"][0]["full_exam"][i]["mark"].toString())),
          DataCell(Text(de["data"][0]["full_exam"][i]["fullmark"].toString())),
        ]));}
// print(de["data"][0]["full_exam"][i]["exam"]["exam_name"]);}
// print(fi.DatRow);
    if(de["data"][0]["part_exam_on_lesson"].isNotEmpty)
      for(int i =0; i < de["data"][0]["part_exam_on_lesson"].length;i++){
        part.DatRow.add(DataRow(cells: [
          DataCell(Container(width:77,child: Text(de["data"][0]["part_exam_on_lesson"][i]["exam"]["exam_name"],softWrap: true,overflow: TextOverflow.visible,))),
          DataCell(Container(width:75,child: Text(de["data"][0]["part_exam_on_lesson"][i]["exam"]["time_ago"],softWrap: true,overflow: TextOverflow.visible))),
          DataCell(Text(de["data"][0]["part_exam_on_lesson"][i]["mark"].toString())),
          DataCell(Text(de["data"][0]["part_exam_on_lesson"][i]["fullmark"].toString())),
        ]));

        /*fi.Date.add(de["data"][0]["full_exam"][i]["exam"]["time_ago"]);
  fi.Degree.add(de["data"][0]["full_exam"][i]["mark"].toString());
fi.FinalDegree.add(de["data"][0]["full_exam"][i]["fullmark"].toString());*/
      }
    if(de["data"][0]["hidden_lessons"].isNotEmpty)
      for(int i =0; i < de["data"][0]["hidden_lessons"].length;i++){
        hidd.DatRow.add(DataRow(cells: [
          DataCell(Text(de["data"][0]["hidden_lessons"][i]["lesson_name"])),
          DataCell(Text(de["data"][0]["hidden_lessons"][i]["time_ago"])),

        ]));

        /*fi.Date.add(de["data"][0]["full_exam"][i]["exam"]["time_ago"]);
  fi.Degree.add(de["data"][0]["full_exam"][i]["mark"].toString());
fi.FinalDegree.add(de["data"][0]["full_exam"][i]["fullmark"].toString());*/
      }
    if(de["data"][0]["saved_lessons"].isNotEmpty)
      for(int i =0; i < de["data"][0]["saved_lessons"].length;i++){
        att.DatRow.add(DataRow(cells: [
          DataCell(Text(de["data"][0]["saved_lessons"][i]["lesson_name"])),
          DataCell(Text(de["data"][0]["saved_lessons"][i]["time_ago"])),

        ]));}

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(fi.DatRow);
    return Scaffold(
        backgroundColor: Color(0xffeeeeee),

        body: ListView(children: <Widget>[
          Center(
              child: Text(
                'الامتحانات الشامله',
                style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*22, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                ),
              )),
          DataTable(
            // dataRowColor: MaterialStateProperty.resolveWith((states) => Colors.blue),
              headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.black.withOpacity(0.9)),
              columnSpacing: MediaQuery.of(context).textScaleFactor*10,
              dataTextStyle: TextStyle(
                  fontFamily: "cairo",
                  color: Colors.black87
              ),
              columns: [
                DataColumn(label: Text(
                    'الامتحان',
                    style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,fontFamily: 'cairo',
                    )
                ),
                ),
                DataColumn(label: Text(
                    'تاريخ الاداء',
                    style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                    )
                )),
                DataColumn(label: Text(
                    'النتيجة',
                    style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                    )
                )),
                DataColumn(numeric:true,label: Text(
                    'النتيجة الكلية',
                    style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                    )
                )),
              ],
              rows:
              fi.DatRow
          ),
          if(fi.DatRow.isEmpty )Center(child: Text("لا يوجد امتحانات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
          Center(
              child: Text(
                'التمارين',
                style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*22, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                ),
              )),
          DataTable(
              dataTextStyle: TextStyle(
                  fontFamily: "cairo",
                  color: Colors.black87
              ),

              // dataRowColor: MaterialStateProperty.resolveWith((states) => Colors.blue),
              headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.black.withOpacity(0.9)),
              columnSpacing: MediaQuery.of(context).textScaleFactor*12,
              columns: [
                DataColumn(label: Text(
                    'الامتحان',
                    style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,fontFamily: 'cairo',
                    )
                ),
                ),
                DataColumn(label: Text(
                    'تاريخ الأداء',
                    style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                    )
                )),
                DataColumn(numeric:true,label: Text(
                    'النتيجه',
                    style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                    )
                )),
                DataColumn(numeric:true,label: Text(
                    'النتيجه الكلية',
                    style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                    )
                )),
              ],
              rows: ex.DatRow
          ),
          if(ex.DatRow.isEmpty)Center(child: Text("لا يوجد تمارين",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
          Center(
              child: Text(
                'الامتحانات الجزئية',
                style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*22, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                ),
              )),
          DataTable(
            dataTextStyle: TextStyle(
                fontFamily: "cairo",
                color: Colors.black87
            ),
            // dataRowColor: MaterialStateProperty.resolveWith((states) => Colors.blue),
            headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.black.withOpacity(0.9)),
            columnSpacing: MediaQuery.of(context).textScaleFactor*20,
            columns: [
              DataColumn(label: Text(
                  'الامتحان',
                  style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,fontFamily: 'cairo',
                  )
              ),
              ),
              DataColumn(label: Text(
                  'تاريخ الأداء',
                  style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                  )
              )),
              DataColumn(numeric:true,label: Text(
                  'النتيجه',
                  style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                  )
              )),
              DataColumn(numeric:true,label: Text(
                  'النتيجه الكلية',
                  style: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                  )
              )),
            ],
            rows:/*[DataRow(cells: [
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),

            ])]*/part.DatRow,
          ),
          if(part.DatRow.isEmpty)Center(child: Text("لا يوجد امتحانات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
          Center(
              child: Text(
                'الدروس التي تم حضورها',
                style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*22, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                ),
              )),
          DataTable(

            dataTextStyle: TextStyle(
                fontFamily: "cairo",
                color: Colors.black,
                fontSize: 15
            ),
            headingTextStyle: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,fontFamily: 'cairo',
            ),
            // dataRowColor: MaterialStateProperty.resolveWith((states) => Colors.blue),
            headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.black.withOpacity(0.9)),
            columnSpacing: MediaQuery.of(context).textScaleFactor*12,
            columns: [

              DataColumn(
                label: Text(
                  'الدرس',
                  textAlign: TextAlign.center,

                ),
              ),
              DataColumn(label: Text(
                'تاريخ الدرس',
                textAlign: TextAlign.center,

              )),

            ],
            rows:att.DatRow,
          ),
          if(att.DatRow.isEmpty)Center(child: Text("لا يوجد دروس",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
          Center(
              child: Text(
                'الدروس التي تم التغيب عنها',
                style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*22, fontWeight: FontWeight.bold,                      fontFamily: 'cairo',
                ),
              )),
          DataTable(
            /*dataTextStyle: TextStyle(
                fontFamily: "cairo",
                color: Colors.black,
            ),*/
            // dataRowColor: MaterialStateProperty.resolveWith((states) => Colors.blue),
              headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.black.withOpacity(0.9)),
              columnSpacing: MediaQuery.of(context).textScaleFactor*12,
              headingTextStyle: TextStyle(color:primary ,fontSize: MediaQuery.of(context).textScaleFactor*15, fontWeight: FontWeight.bold,fontFamily: 'cairo',
              ),
              columns: [
                DataColumn(label: Text(
                  'الدرس',

                ),
                ),
                DataColumn(label: Text(
                  'تاريخ الدرس',

                )),

              ],
              rows: hidd.DatRow
          ),
          if(hidd.DatRow.isEmpty)Center(child: Text("لا يوجد دروس",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),


        ])
    );
  }

/*List<DataRow>getExamrow(List<Exam> ExamElement) {
  return ExamElement.map((e) =>DataRow(cells: [
  DataCell(Text(e.Name)),
  DataCell(Text(e.Date)),
  DataCell(Text("${e.Degree}")),
  DataCell(Text("${e.FinalDegree}")),
])).toList();
}*/
/*
  List<DataRow>getAttendanceRow(List<Attendance> AttendanceElement) {
    return AttendanceElement.map((e) {
      return DataRow(cells: [
    DataCell(Text(e.Name)),
    DataCell(Text(e.Date)),

  ]);
    }).toList();
  }*/
}
/*
de["data"][0]["full_exam"][0]["exam"]["exam_name"]
de["data"][0]["full_exam"][0]["exam"]["time_ago"]
de["data"][0]["full_exam"][0]["mark"]
de["data"][0]["full_exam"][0]["fullmark"]
 */