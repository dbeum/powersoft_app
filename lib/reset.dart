import 'package:flutter/material.dart';
import 'package:powersoft_app/login.dart';
import 'package:http/http.dart' as http;

class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _OldPasswordController = TextEditingController();
  TextEditingController _NewPasswordController = TextEditingController();

  Future<void> _Reset(username, OldPassword, NewPassword) async {
    String username = _usernameController.text;
    String OldPassword = _OldPasswordController.text;
    String NewPassword = _NewPasswordController.text;

    final apiUrl = 'http://powersoftrd.com/PEApi/api/ResetPasswordEmp/741258';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': username,
          'oldPassword': OldPassword,
          'NewPassword': NewPassword,
        },
      );

      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password Reset success')));
      } else {
        print('An error occurred: ${response.statusCode}');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Reset Failed')));
      }
    } catch (e) {
      print('An error occurred: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Reset Failed')));
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
              autocorrect: true,
              controller: _OldPasswordController,
              enableSuggestions: false,
              decoration: InputDecoration(
                  labelText: 'Enter Old Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 330),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              autocorrect: false,
              obscureText: true,
              controller: _NewPasswordController,
              enableSuggestions: false,
              decoration: InputDecoration(
                  labelText: 'Enter New password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 45, 175, 229)),
            margin: EdgeInsets.only(top: 400, left: 140),
            child: TextButton(
              onPressed: () {
                String username = _usernameController.text;
                String OldPassword = _OldPasswordController.text;
                String NewPassword = _NewPasswordController.text;
                _Reset(username, OldPassword, NewPassword);
              },
              child: Text(
                'Reset',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
