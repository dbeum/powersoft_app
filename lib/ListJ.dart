import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Attendance.dart';
import 'location.dart';
import 'exp-attendance.dart';


class ListPage extends StatelessWidget {
   final String employeeId;

    ListPage({required this.employeeId, Key? key}) : super(key: key);


Future<List<AttendanceData>> fetchAttendanceData(http.Client client) async {
  final response = await client.get(Uri.parse('http://198.154.112.5/PEApi/api/GetAttendanceByEmployee/741258?EmployeeID=$employeeId'),
  headers: {'Authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBDTU4vMDA3MCIsIm5iZiI6MTY5ODA0OTE2NCwiZXhwIjoxNzAwNjQxMTY0LCJpYXQiOjE2OTgwNDkxNjR9.AUDZ_1LoYBGjXC3ad6h-8KuKj22L3wpWsllj-rM2Kc4'}
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final List<dynamic> data = jsonData['data'];
    return data.map((e) => AttendanceData.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load attendance data');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: FutureBuilder<List<AttendanceData>>(
        future: fetchAttendanceData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return AttendanceList(employeeId: employeeId,data: snapshot.data!);
          } else {
            return const Center(
              child: Text('No data available.'),
            );
          }
        },
      ),
    );
  }
}

class AttendanceData {
  final String attendanceDate;
  final String employeeId;
  final String timeIn;
  final bool absent;
  final bool clockedIn;
  final bool clockedOut;
  final String geolocationAddress;
  final double geoLongitude;
  final double geoLatitude;
  final String systemDate;
  final String geolocationAddress2;

  AttendanceData({
    required this.attendanceDate,
    required this.employeeId,
    required this.timeIn,
    required this.absent,
    required this.clockedIn,
    required this.clockedOut,
    required this.geolocationAddress,
    required this.geoLongitude,
    required this.geoLatitude,
    required this.systemDate,
    required this.geolocationAddress2,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
     
      attendanceDate: json['attendanceDate'] as String,
      employeeId: json['employeeId'] as String,
      timeIn: json['timeIn'] as String,
      absent: json['absent'] as bool,
      clockedIn: json['clockedIn'] as bool,
      clockedOut: json['clockedOut'] as bool,
      geolocationAddress: json['geolocationAddress'] as String,
      geoLongitude: json['geoLongitude'] as double,
      geoLatitude: json['geoLatitude'] as double,
      systemDate: json['systemDate'] as String,
      geolocationAddress2: json['geolocationAddress2'] as String,
    );
  }
}


class AttendanceList extends StatelessWidget {
  final String employeeId;

 AttendanceList({required this.employeeId, required this.data, Key? key}) : super(key: key);

  final List<AttendanceData> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body:Stack(
       children:[ ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final attendance = data[index];
        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Exp(attendanceData: attendance),));
          },
          title: Text('Date & Time In: ${attendance.attendanceDate}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8), // Add some space between title and subtitles
              Row(
                children: [
                  Text('Clocked In: ${attendance.clockedIn}',style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 16), // Add space between clocked in and clocked out text
                  Text('Clocked Out: ${attendance.clockedOut}',style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8), // Add space between clocked in/out and lat&long text
              Text('Adress: ${attendance.geolocationAddress2}'),
              Container(
              width: 2, // Increase the width to make it more visible
      
      height: 20, // Set a height for the vertical line

              )
            ],
            
          ),
           
          
          
          // Add more fields as needed
        );
      },
    ),
    Positioned(
      top: 600,
      left: 300,
      child: FloatingActionButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => 
      //Attendance(employeeId: employeeId))
      Locator(employeeId: employeeId,))
    );
    },child: Icon(Icons.add))
      )]
    )
    );

  }
}