//Phone List View
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:ubuni_phone_app/json/api_handler.dart';
import 'package:ubuni_phone_app/model/phone.dart';

class PhoneList extends StatefulWidget {
  @override
  _PhoneListState createState() => _PhoneListState();
}

class _PhoneListState extends State<PhoneList> {
  List<Phone> phoneList = <Phone>[];

  void getPhonesfromJson() async {
    PhoneJson.getPhoneJson().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        phoneList = list.map((model) => Phone.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPhonesfromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff392850),
        title: Text(
          "Ubuni Shop",
          style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: phoneList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    phoneList[index].name,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    phoneList[index].brand,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Image.network(phoneList[index].imageUrl),
                  trailing: Icon(Icons.shopping_cart_sharp),
                  onTap: () {
                    _showPhone(context, index);
                  },
                ),
              );
            }),
      ),
    );
  }

  void _showPhone(BuildContext context, int index) {
    var alertDialog = new AlertDialog(
      title: Container(
        child: Column(
          children: <Widget>[
            Image.network(
              phoneList[index].imageUrl,
              height: 200,
              width: 200,
            ),
            Column(
              children: <Widget>[
                Text(phoneList[index].name),
                Text(phoneList[index].brand),
              ],
            ),
            Text("Price: 200 USD"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //ignore: deprecated_member_use
                TextButton(
                  // color: Colors.blue,
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(
                      color: Color(0xff392850),
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text(
                          "Thanks For Shopping With Us Your Order Is On The Way!"),
                      duration: Duration(seconds: 5),
                    );
                    // ignore: deprecated_member_use
                    Scaffold.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                  },
                ),
                //ignore: deprecated_member_use
                TextButton(
                  // color: Colors.blue,
                  child: Text(
                    "CANCEL",
                    style: TextStyle(
                      color: Color(0xff392850),
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
