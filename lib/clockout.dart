import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class clockout extends StatefulWidget {
  const clockout({super.key});

  @override
  State<clockout> createState() => _clockoutState();
}

class _clockoutState extends State<clockout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
          children:[ 
            Positioned(
              top: 50,
              left: 70,
              child: 
              Image.asset('assets/images/powersoft.png') ),
              Positioned(
               top:50, 
                child:
              Image.asset('assets/images/watch.png')),
               Positioned(
               top:330, 
               left: 50,
                child:
              Image.asset('assets/images/calender.png')),
             // Container(
              //height: 2,
              //color: Colors.black,
              //margin: EdgeInsets.only(top: 190),
              
            //),
            Positioned(
              top:345,left:120,child: Text('${formattedDate()}',style:GoogleFonts.tiltNeon( textStyle:TextStyle(fontSize: 30),)
              )),
Positioned(
              top:300,left:90,child: Text('${formattedTime()}',style:GoogleFonts.pacifico(textStyle: TextStyle(fontSize: 30)),)
              ),
            //  Positioned(
              //top:280,left:10,child: Text('Current Address: ',style:GoogleFonts.inconsolata(textStyle: TextStyle(fontSize: 20)),)
              //),
                //            Positioned(
              //top:305,child: Text(' ${widget.Address}',style:GoogleFonts.inconsolata(textStyle: TextStyle(fontSize: 11.5,fontWeight: FontWeight.bold)),)
              //),
           //  Container(
             // height: 2,
              //color: Colors.black,
              //margin: EdgeInsets.only(top: 230),
              
            //),
            //  Container(
              //height: 2,
              //color: Colors.black,
              //margin: EdgeInsets.only(top: 320),
              
            //),
           //  Container(

             // height: 2,
              //color: Colors.black,
              //margin: EdgeInsets.only(top: 270),
              
            //),
          
           Positioned(
top:450,
left: 130,
      child: ElevatedButton(
        onPressed: () {
           
         

        },
        child: Container(
          
          
          child: Text('Clock Out'),
          
        ),
        
      ),
    )
    ])
    );
  }
   String formattedDate() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }
  String formattedTime() {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm a');
    return formatter.format(now);
  }
}