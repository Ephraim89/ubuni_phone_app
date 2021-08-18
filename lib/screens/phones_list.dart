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
        title: Text("Mobile Shop"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: phoneList.length,
          itemBuilder: (context, index){
          return ListTile(
            title: Text(phoneList[index].name),
            subtitle: Text(phoneList[index].brand),
            leading: CircleAvatar(backgroundImage: NetworkImage(phoneList[index].imageUrl),),
          );
        }),
      ),
    );
  }
}
