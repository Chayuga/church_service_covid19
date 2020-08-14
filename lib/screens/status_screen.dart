import 'package:churchapp/screens/route_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import 'package:churchapp/http/contant/constant.dart';
import 'package:churchapp/models/bookedModel.dart';
import 'package:flutter/material.dart';

class BookingStatus extends StatefulWidget {
  @override
  _BookingStatusState createState() => _BookingStatusState();
}

//booked url
final fetchBookUrl =
    'http://remedy254.000webhostapp.com/churchApi/book/seat/booked';

class _BookingStatusState extends State<BookingStatus> {
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

  List<Booked> booked = [];
  @override
  void initState() {
    getBooked();
  }

  Future<List<Booked>> getBooked() async {
    //get user id  from pref
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _userId = preferences.getString("userId");
    // TODO: implement getCategories
    // Store all data with Param Name.
    var data = {"user_id": "$_userId"};
    // Starting Web API Call.
    var response = await http.post(fetchBookUrl, body: data);
    final jsonResponse = jsonDecode(response.body);
    final result = (jsonResponse['reservation'] as List)
        .map((booked) => Booked.fromJson(booked));

    booked..addAll(result);
    return booked;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8, 1, 1, 1),
          child: Image.asset(
            'assets/images/dcu-logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () => logOut(),
          ),
        ],
        title: Center(child: Text('Booked on: ')),
        backgroundColor: primaryColor,
      ),
      body: booked.length == 0
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : showMyUI(),
    );
  }

  Widget showMyUI() {
    return new ListView.builder(
      itemCount: booked.length,
      itemBuilder: (_, index) {
        return new Container(
          margin: new EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
          child: new Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text(
                        'Selected Service : ${booked[index].serviceType} Service'),
                    // new Padding(
                    //     padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    // new Text('ID : ${booked[index].reservationId}'),
                    new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text('Seats : ${booked[index].seatNo}'),
                    new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text(
                        'Remaining seats : ${booked[index].availableSeats}'),
                    new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text('Starts : ${booked[index].startHour}'),
                    new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text('Ends : ${booked[index].endHour}'),
                    new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text('Scheduled for date : ${booked[index].createdAt}'),
                    new Padding(
                        padding: new EdgeInsets.symmetric(vertical: 3.0)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
