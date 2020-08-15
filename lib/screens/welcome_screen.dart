import 'package:churchapp/screens/route_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Color primaryColor = Color(0xff18203d);
  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RouteController()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        leading: Padding(
//          padding: const EdgeInsets.fromLTRB(8, 1, 1, 1),
//          child: Image.asset(
//            'assets/images/dcu-logo.png',
//            fit: BoxFit.contain,
//            height: 25,
//          ),
//        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.exit_to_app,
//              color: Colors.white,
//            ),
//            onPressed: () => logOut(),
//          ),
//        ],
//        title: Center(child: Text('Reopening Message')),
//        backgroundColor: primaryColor,
//      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/dcu-logo.png',
              fit: BoxFit.contain,
              height: 100,
            ),
            Center(
              child: Text("Deliverance Church Utawala\nThe Church of Choice",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "MESSAGE TO ALL",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '''I am delighted to have you visit our church App. It is my privilege to serve as Pastor of Deliverance Church Utawala, Kenya.\n\nMy heartfelt prayer is for people to know the Lord Jesus Christ as their personal Lord and Savior. We also want you to become actively involved in a Bible believing, Bible preaching, Fundamental church that cares for you.\n\nWe make no apology for the Word of God. We preach the Bible. We preach sound doctrine from that Word and devotion to the Lord Jesus Christ. (Romans 1:16). Our motto is: \nTouching Heaven, Changing Earth. \nThe truth will never be watered down. Sin will be called sin. Right will be called right. But the truth will always be preached in love.\n\nCheck out the various pages on our website. If you are not certain that if you died today that heaven is your home, and then email us. We will get back to you quickly and share with you GOD’S simple plan of salvation.''',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              color: Colors.black87,
                              fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("ODER OF SERVICE",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '''1st Service   [7:30am - 9:30am]\n\n2nd Service   [9:30am - 11:30am]\n\n3rd Service   [11:30am - 1:30pm]\n\n4th Service   [1:30pm - 3:30pm]''',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.openSans(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
