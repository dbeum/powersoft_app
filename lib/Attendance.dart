import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ListJ.dart';
import 'profile.dart';

class Attendance extends StatefulWidget {
 final String employeeId;
 final double latitude;
  final double longitude;
final String Address;

  const Attendance({
    Key? key,
   required this.employeeId,
    required this.latitude, 
     required this.longitude, 
       required this.Address,   // Pass the employeeId to the constructor
  }) : super(key: key);


  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
// String formattedDate='';
//String Address = '';
 //Future<Position> _getCurrentLocation() async {
   // bool serviceEnabled;
    //LocationPermission permission;

    //serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //if (!serviceEnabled) {
    //  return Future.error('Location services are disabled.');
    //}

    //permission = await Geolocator.checkPermission();
    //if (permission == LocationPermission.denied) {
      //permission = await Geolocator.requestPermission();
      //if (permission == LocationPermission.denied) {
        //return Future.error('Location permissions are denied.');
      //}
    //}

    //if (permission == LocationPermission.deniedForever) {
      //return Future.error('Location permissions are permanently denied.');
    //}

    //return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    
  //}

  Future <void> postData() async{
    
// Position currentPosition = await _getCurrentLocation();
 
  //  String latitude = currentPosition.latitude.toString();
    //String longitude = currentPosition.longitude.toString();

    String Date = formattedDate(); 
  String Time = formattedTime();

    final String apiUrl='http://198.154.112.5/PEApi/api/AddAttendance/741258?';

    // DateTime now = DateTime.now();

 //String formattedDate = now.toUtc().toIso8601String();
   
  

      final Map<String, dynamic> data = {
      "CompanyId": "string",
      "DivisionId": "string",
      "DepartmentId": "string",
      "AttendanceDate": Date,
      "EmployeeId": widget.employeeId,
      "TimeIn":   formattedTime(),
      "Absent": true,
      "Remarks": "string",
      "LockedBy": "string",
      "LockTs": Date,
      "LatePeriod": 0,
      "Period": Date,
      "ShiftType": "string",
      "ExpectedTimeIn": "8:30",
      "BranchCode": "string",
      "ClockOutTimeOut":  Date,
      "AttendanceStatus": "string",
      "ClockedIn": true,
      "ClockedOut": true,
      "GeolocationAddress": "string",
      "GeoLongitude": widget.longitude,
      "GeoLatitude": widget.latitude,
      "SystemDate": Date,
      "GeolocationAddress2": widget.Address
    };
    final String bearerToken='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBDTU4vMDA4MCIsIm5iZiI6MTY5NTY0OTI0NywiZXhwIjoxNjk4MjQxMjQ3LCJpYXQiOjE2OTU2NDkyNDd9.3anwQ1MQSsj_1amjKAYlAj061Bi95ZX25RrsWkO14Yw';

    final response =await http.post(Uri.parse(apiUrl),
     headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $bearerToken', // Include Bearer token in headers
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      // Request was successful, handle the response here
      final data =json.decode(response.body);
      print('Response data: $data');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('success')));
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(employeeId: widget.employeeId,),));
    } else {
      // Request failed, handle the error here
      print('Failed to load data, status code: ${response.statusCode}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('failed')));
    }
  }
 // Future<void> GetAddressFromLatLong(Position position)async {
   // List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    //print(placemarks);
    //Placemark place = placemarks[0];
    //Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    //setState(()  {
    //});
  //}
  @override
  Widget build(BuildContext context) {
       return Scaffold(

        body: Stack(
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
           
          postData();

        },
        child: Container(
          
          
          child: Text('Clock In'),
          
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