import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'profile.dart';
import 'reset.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 90,
            child: Image.asset('assets/images/powersoft.png'),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 200),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              autocorrect: true,
              controller: _usernameController,
              enableSuggestions: false,
              decoration: InputDecoration(
                  labelText: 'Enter Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 260),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              autocorrect: false,
              obscureText: true,
              enableSuggestions: false,
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Enter password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 300, left: 100),
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Reset()));
                },
                child: Text('forgotten password?')),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 45, 175, 229)),
            margin: EdgeInsets.only(top: 500, left: 140),
            child: TextButton(
              onPressed: () {
                _login();
              },
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
