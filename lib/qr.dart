import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'profile.dart';

class ScanQrPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null && result!.code != null) {
          final extractedData = jsonDecode(result!.code!);
          print("QR Code Data: $extractedData");
          // Assuming QR code contains JSON data.
          final qrUsername = extractedData['username'];
          final qrPassword = extractedData['password'];

          if (qrUsername != null && qrPassword != null) {
            _login(qrUsername, qrPassword);
          }
        }
      });
    });
  }

  Future<void> _login(String username, String password) async {
    final apiUrl = 'http://198.154.112.5/PEApi/api/Login/741258';

    try {
      final response = await http.get(
        Uri.parse('$apiUrl?Username=$username&Password=$password'),
      );

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        var employeeName = userData['data']['employeeName'];
        var employeeId = userData['data']['employeeId'];
        var employeeUserName = userData['data']['employeeUserName'];
        var employeeDepartmentId = userData['data']['employeeDepartmentId'];
        var employeeAddress1 = userData['data']['employeeAddress1'];
        var employeeAddress2 = userData['data']['employeeAddress2'];
        if (employeeAddress2 == null) {
          employeeAddress2 = userData['data']['employeeCity'];
        }
        var employeeCountry = userData['data']['employeeCountry'];
        var employeeEmailAddress = userData['data']['employeeEmailAddress'];
        var genderId = userData['data']['genderId'];
        var statusId = userData['data']['statusId'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(
              employeeName: employeeName,
              employeeId: employeeId,
              employeeUserName: employeeUserName,
              employeeDepartmentId: employeeDepartmentId,
              employeeAddress1: employeeAddress1,
              employeeAddress2: employeeAddress2,
              employeeCountry: employeeCountry,
              employeeEmailAddress: employeeEmailAddress,
              genderId: genderId,
              statusId: statusId,
            ),
          ),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login success')));
      } else if (response.statusCode == 401) {
        // Unauthorized
        print('Invalid username or password');

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid username or password')));
      } else {
        print('An error occurred: ${response.statusCode}');

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login Failed')));
      }
    } catch (e) {
      print('An error occurred: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Failed')));
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.orange,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }
}
