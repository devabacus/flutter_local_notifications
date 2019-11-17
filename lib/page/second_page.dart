import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String payload;

  const SecondScreen({Key key, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            payload,
            style: TextStyle(fontSize: 30),
          ),
          RaisedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
