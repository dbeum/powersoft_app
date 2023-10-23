import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logout.dart';
import 'payslip.dart';
import 'Attendance.dart';
import 'ListJ.dart';

class Profile extends StatefulWidget {
  final String? employeeName;
  final String? employeeId;
  final String? employeeUserName;
  final String? employeeDepartmentId;
  final String? employeeAddress1;
  final String? employeeAddress2;
  final String? employeeCountry;
  final String? employeeEmailAddress;
  final String? genderId;
  final String? statusId;

  const Profile({
    Key? key,
    this.employeeName,
    this.employeeId,
    this.employeeUserName,
    this.employeeDepartmentId,
    this.employeeAddress1,
    this.employeeAddress2,
    this.employeeCountry,
    this.employeeEmailAddress,
    this.genderId,
    this.statusId,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final LogoutPage _authService = LogoutPage();
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
            child: Stack(children: [
              
          Positioned(
            top: 100,
            left: 30,
              child: Text(
                '${widget.employeeUserName ?? 'loading'}',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color:Color.fromARGB(255, 45, 175, 229) ),
              )),
          Positioned(
              top:145,
              left: 50,
              child: Text(
                '${widget.employeeDepartmentId ?? 'loading'}',
                style: GoogleFonts.tiltNeon(textStyle:TextStyle( fontSize:25,)),
              )),
        Positioned(
              top:210,
              left: 10,
              child: Text(
               'Employee Details',
                style: GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              )),
       
          Positioned(
              top: 250,
              left: 20,
              child: Text('Employee ID',
                  style: TextStyle(fontWeight: FontWeight.bold))),
           Positioned(
                top: 280,
                left: 20,
                  child: Text(
                    '${widget.employeeId ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                Positioned(
                  top: 305,
                  width: 500,
                  height: 5,
                  
                  child:
               Container(
                height: 10,
                 color: Color.fromARGB(255, 217, 217, 217),
               ),),
          Positioned(
              top: 320,
              left: 20,
              child: Text(
                'Employee Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
               Positioned(

                  top:350,left: 20,
                  child: Text(
                    '${widget.employeeName ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
               Positioned(
                  top: 380,
                  width: 500,
                  height: 5,
                  
                  child:
               Container(
                height: 10,
                 color: Color.fromARGB(255, 217, 217, 217),
               ),),
         
          Positioned(
              top: 395,
              left: 20,
              child: Text(
                'Street Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
           Positioned(
                  top:420,left: 20,
                  child: Text(
                    '${widget.employeeAddress1 ?? 'loading'}',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  )),
                  Positioned(
                  top: 450,
                  width: 500,
                  height: 5,
                  
                  child:
               Container(
                height: 10,
                 color: Color.fromARGB(255, 217, 217, 217),
               ),),
          Positioned(
              top: 460,
              left: 20,
              child: Text(
                'City',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
           Positioned(
                top:485,left: 20,
                  child: Text(
                    '${widget.employeeAddress2 ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                       Positioned(
                  top: 515,
                  width: 500,
                  height: 5,
                  
                  child:
               Container(
                height: 10,
                 color: Color.fromARGB(255, 217, 217, 217),
               ),),
          Positioned(
              top: 530,
              left: 20,
              child: Text(
                'Country',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
         Positioned(
                top: 555, left: 20,
                  child: Text(
                    '${widget.employeeCountry ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                         Positioned(
                  top: 585,
                  width: 500,
                  height: 5,
                  
                  child:
               Container(
                height: 10,
                 color: Color.fromARGB(255, 217, 217, 217),
               ),),
          Positioned(
              top: 600,
              left: 20,
              child: Text(
                'Email Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Positioned(
                 top: 625, left: 20,
                  child: Text(
                    '${widget.employeeEmailAddress ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                         Positioned(
                  top: 655,
                  width: 500,
                  height: 5,
                  
                  child:
               Container(
                height: 10,
                 color: Color.fromARGB(255, 217, 217, 217),
               ),),
          Positioned(
              top: 670,
              left: 20,
              child: Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Positioned(
                 top: 695, left: 20,
                  child: Text(
                    '${widget.genderId ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                        Positioned(
                  top: 725,
                  width: 500,
                  height: 5,
                  
                  child:
               Container(
                height: 10,
                 color: Color.fromARGB(255, 217, 217, 217),
               ),),
          Positioned(
              top: 735,
              left: 20,
              child: Text(
                'Marital Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Positioned(
                top: 755, left: 20,
                  child: Text(
                    '${widget.statusId ?? 'No Data'} ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                    Positioned(
                  top: 785,
                  width: 500,
                  height: 5,
                  
                  child:
               Container(
                height: 10,
                 color: Color.fromARGB(255, 217, 217, 217),
               ),),
        Container(margin: EdgeInsets.only(top: 830), height: 10)
        ]
        )
        ),
        //DRAWER
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(height: 70),
              ListTile(
                onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>ListPage(employeeId: widget.employeeId ?? '')));
                },
                title:Text('Attendance',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
              ),
              SizedBox(height: 30,),
              ListTile(
                onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Payslip(employeeId: widget.employeeId ?? ''),));
                },
                title: Text('Payslip',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),SizedBox(height: 450,),
              ListTile(
                onTap: () {
                     _authService.logout(context);
                },
                leading: Icon(Icons.login_outlined,color: Colors.red,),
                title: Text('Log out',style:GoogleFonts.signika(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
        //DRAWER ENDS
        );
  }
}
