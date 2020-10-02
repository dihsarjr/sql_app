import 'package:flutter/material.dart';
import 'package:sql_app/db_provider.dart';
import 'package:sql_app/model/user_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingControllerEmail = TextEditingController();

  TextEditingController textEditingControllerPassword = TextEditingController();
  @override
  void initState() {
    final data = DBProvider.db.getUser().then((value) {
      print(value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: textEditingControllerEmail,
              decoration: InputDecoration(hintText: 'Email'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: textEditingControllerPassword,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: () {
              var newDbUser = User(
                  password: textEditingControllerPassword.text,
                  userName: textEditingControllerEmail.text);
              DBProvider.db.newUser(newDbUser);
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
