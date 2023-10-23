import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powersoft_app/Attendance.dart';


class Locator extends StatefulWidget {
final String employeeId;
 const Locator({
    Key? key,
   required this.employeeId,
  }) : super(key: key);


  @override
  _LocatorState createState() => _LocatorState();
}

class _LocatorState extends State<Locator> {

  String location ='Press Button';
  String Address = 'searching...';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
     
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
     
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
     showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack( children:[ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/map1.png'),
            Text('Coordinates Points',style: GoogleFonts.tiltNeon(textStyle:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),),
            SizedBox(height: 10,),
            Text(location,style:GoogleFonts.tiltNeon(textStyle:TextStyle(color: Colors.black,fontSize: 16), ) ),
            SizedBox(height: 10,),
           // Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
           // SizedBox(height: 10,),
           
          
          ],
        ),
       Container(
            margin: EdgeInsets.only(top: 490,left: 10),child: 
            Text('${Address}',style: GoogleFonts.tiltNeon(textStyle:TextStyle() ))),

            Container(
               margin: EdgeInsets.only(top: 530,left: 120),
              child:  ElevatedButton(onPressed: () async{
              Position position = await _getGeoLocationPosition();
              location ='Lat: ${position.latitude} , Long: ${position.longitude}';
              await GetAddressFromLatLong(position);
                  await Future.delayed(Duration(seconds: 10));
              Navigator.push(context, MaterialPageRoute(builder: (context) => Attendance(employeeId:widget. employeeId, latitude: position.latitude, longitude: position.longitude, Address: Address),));
            }, child: Text('Get Location'))
            )
      ])),
    );
  }
}
