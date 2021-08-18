import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/screens/phones_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ubuni Mobile Shop",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 350,
                      child: Text(
                        'Hello and welcome to Ubuni Shop app, the place to find the best Smartphones.\nWe througly check the quality of our goods so that you only receive the best quality phones.\n\nWe at Ubuni Shop believe in high quality and exceptional customer service. But most importantly, we believe shopping is a right, not a luxury, so we strive to deliver the best smartphones at the most affordable prices, and ship them to you regardless of where you are located.',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            height: 50,
            minWidth: 45,
            splashColor: Color(0xff392850),
            color: Colors.cyan.shade900,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PhoneList()));
            },
            child: Text(
              "Shop Now",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
