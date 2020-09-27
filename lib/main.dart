import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String req='';
String res='';
List<String>sym=[
  "C",
  "()",
  "%",
  "/",
  "7",
  "8",
  "9",
  "*",
  "4",
  "5",
  "6",
  "-",
  "1",
  "2",
  "3",
  "+",
  "0",
  ".",
  "del",
  "=",
];
double fontSizeReq=15;//35
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor:Color(0xff1E2747),

       body:Column(
         children: <Widget>[
           SizedBox(
             height:96,
           ),
        Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: <Widget>[
            Text(req,style:TextStyle(
              color:Colors.white,
              fontSize:fontSizeReq
            ),),
            SizedBox(width:17,),

          ],
        ),
           SizedBox(
             height:57,
           ),
           Row(
             mainAxisAlignment:MainAxisAlignment.end,
             children: <Widget>[
               Text(res,style:TextStyle(
                   color:Colors.white,
                   fontSize:45
               ),),
               SizedBox(width:17,),

             ],
           ),

          SizedBox(
            height:0,
          ),
           Container(
             child: Expanded(
              child:Container(
                width:MediaQuery.of(context).size.width,
                color:Color(0xff1E2747),
                child:Column(
                  children: <Widget>[
                    Expanded(
                      child:Padding(

                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:4,
                          crossAxisSpacing:7.6,
                              mainAxisSpacing:7.6,

                        ), itemCount:20,
                            itemBuilder:(_,int index){
                           return InkWell(
                             onTap:(){

                               if(index == 2 || index == 3||index ==4 || index ==5 || index ==6 || index  == 7 || index == 11 || index == 15 ||index ==8 || index ==9 || index ==10 || index ==12 || index ==13 || index ==14 || index ==16 || index ==17){
                                 setState(() {
                                   req+=sym[index];
                                 });
                               }
                               if(index == 0){
                                  if(req.length == 0){
                                    setState(() {
                                      res='';
                                    });
                                  }
                                 setState(() {
                                   req=req.substring(0,req.length-1);
                                 });
                               }
                               if(index ==18){
                                 setState(() {
                                   req='';
                                   res='';
                                 });
                               }
                               if(index == 19){

                                 String inputString=req;
                                 Parser p= Parser();
                                 Expression exp=p.parse(inputString);
                                 ContextModel cm=ContextModel();
                                 double eval=exp.evaluate(EvaluationType.REAL,cm);
                                 setState(() {
                                   res=eval.toString().trim();
                                 });

                               }

                               
                             },
                             child: ClipRRect(
                               borderRadius:BorderRadius.all(Radius.circular(23.0)),
                               child: Container(
                                 height:35,
                                 color:getColor(index),
                                 child:Center(
                                   child:Text(sym[index],style:TextStyle(color:Colors.white,fontSize:20),)
                                 ),
                               ),
                             ),
                           );
             }),
                      )
                    )
                  ],
                ),
              ),
             ),
           )

         ],
       ),
     );
  }
  Color getColor(int index){
    if(index == 7 || index == 11 || index == 15){
      return Colors.blue;
    }
    else if(index == 19 || index ==3){

      return Colors.blue;
    }
    else if(index == 0){

      return Colors.greenAccent;
    }
    else{
      return Color.fromRGBO(255,255,255,.1);
    }
  }
  
}
