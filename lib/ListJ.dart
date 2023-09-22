import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MyHomePage extends StatelessWidget {
   final String employeeId;

    MyHomePage({required this.employeeId, Key? key}) : super(key: key);


Future<List<AttendanceData>> fetchAttendanceData(http.Client client) async {
  final response = await client.get(Uri.parse('http://198.154.112.5/PEApi/api/GetAttendanceByEmployee/741258?EmployeeID=$employeeId'),
  headers: {'Authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBDTU4vMDA3MCIsIm5iZiI6MTY5NTMwOTQ4NywiZXhwIjoxNjk3OTAxNDg3LCJpYXQiOjE2OTUzMDk0ODd9.VZJ-nxs3h3dBVeDqHQLRdj0I49ysMaayl5dD2oAAT_c'}
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
        title: Text('title'),
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
            return AttendanceList(data: snapshot.data!);
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
  final String companyId;
  final String divisionId;
  final String departmentId;
  final String attendanceDate;
  final String employeeId;
  final String timeIn;
  final bool absent;
  final String remarks;
  final String lockedBy;
  final String lockTs;
  final double latePeriod;
  final String period;
  final String shiftType;
  final String expectedTimeIn;
  final String branchCode;
  final bool clockedIn;
  final bool clockedOut;
  final String geolocationAddress;
  final double geoLongitude;
  final double geoLatitude;
  final String systemDate;
  final String geolocationAddress2;

  AttendanceData({
    required this.companyId,
    required this.divisionId,
    required this.departmentId,
    required this.attendanceDate,
    required this.employeeId,
    required this.timeIn,
    required this.absent,
    required this.remarks,
    required this.lockedBy,
    required this.lockTs,
    required this.latePeriod,
    required this.period,
    required this.shiftType,
    required this.expectedTimeIn,
    required this.branchCode,
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
      companyId: json['companyId'] as String,
      divisionId: json['divisionId'] as String,
      departmentId: json['departmentId'] as String,
      attendanceDate: json['attendanceDate'] as String,
      employeeId: json['employeeId'] as String,
      timeIn: json['timeIn'] as String,
      absent: json['absent'] as bool,
      remarks: json['remarks'] as String,
      lockedBy: json['lockedBy'] as String,
      lockTs: json['lockTs'] as String,
      latePeriod: json['latePeriod'] as double,
      period: json['period'] as String,
      shiftType: json['shiftType'] as String,
      expectedTimeIn: json['expectedTimeIn'] as String,
      branchCode: json['branchCode'] as String,
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
  const AttendanceList({super.key, required this.data});

  final List<AttendanceData> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final attendance = data[index];
        return ListTile(
          title: Text('Date: ${attendance.attendanceDate}'),
          subtitle: Text('Employee ID: ${attendance.employeeId}'),
          // Add more fields as needed
        );
      },
    );
  }
}