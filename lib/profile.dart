import 'package:flutter/material.dart';
import 'logout.dart';
import 'payslip.dart';

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
          Container(
            height: 130,
            width: 130,
            margin: EdgeInsets.only(top: 100, left: 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 175, 229),
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(360))),
          ),
          //TOP LAYER
          Container(
              margin: EdgeInsets.only(left: 160, top: 130),
              child: Text(
                '${widget.employeeUserName ?? 'loading'}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.only(left: 170, top: 160),
              child: Text(
                '${widget.employeeDepartmentId ?? 'loading'}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
          //LOGOUT
          Container(
            height: 30,
            width: 70,
            margin: EdgeInsets.only(top: 50, left: 280),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.black, width: 2)),
            child: TextButton(
                onPressed: () {
                  _authService.logout(context);
                },
                child: Text(
                  'LOGOUT',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )),
          ),
          Container(
              margin: EdgeInsets.only(left: 20, top: 40),
              child: Text(
                'Profile info',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          //PAYSLIP
          Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Color.fromARGB(255, 45, 175, 229)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.only(left: 250, top: 200),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Payslip(employeeId: widget.employeeId ?? ''),
                      ));
                },
                child: Text(
                  'Payslip',
                  style: TextStyle(fontSize: 10),
                )),
          ),
          //TOP LAYER ENDS
          Positioned(
              top: 250,
              left: 20,
              child: Text('Employee ID',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Container(
              height: 50,
              width: 340,
              margin: EdgeInsets.only(top: 270, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '${widget.employeeId ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
          Positioned(
              top: 340,
              left: 20,
              child: Text(
                'Employee Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              height: 50,
              width: 340,
              margin: EdgeInsets.only(top: 360, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '${widget.employeeName ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
          Positioned(
              top: 430,
              left: 20,
              child: Text(
                'Street Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              height: 50,
              width: 340,
              margin: EdgeInsets.only(top: 450, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '${widget.employeeAddress1 ?? 'loading'}',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ))),
          Positioned(
              top: 520,
              left: 20,
              child: Text(
                'City',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              height: 50,
              width: 340,
              margin: EdgeInsets.only(top: 540, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '${widget.employeeAddress2 ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
          Positioned(
              top: 610,
              left: 20,
              child: Text(
                'Country',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              height: 50,
              width: 340,
              margin: EdgeInsets.only(top: 630, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '${widget.employeeCountry ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
          Positioned(
              top: 700,
              left: 20,
              child: Text(
                'Email Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              height: 50,
              width: 340,
              margin: EdgeInsets.only(top: 720, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '${widget.employeeEmailAddress ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
          Positioned(
              top: 790,
              left: 20,
              child: Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              height: 50,
              width: 340,
              margin: EdgeInsets.only(top: 810, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '${widget.genderId ?? 'loading'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
          Positioned(
              top: 880,
              left: 20,
              child: Text(
                'Marital Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              height: 50,
              width: 340,
              margin: EdgeInsets.only(top: 900, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '${widget.statusId ?? 'No Data'} ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
          Container(margin: EdgeInsets.only(top: 990), height: 10)
        ])));
  }
}
