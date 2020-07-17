
import 'package:flutter/material.dart';
import 'package:ypay/Providers/AppLocalization.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text(AppLocalizations.of(context).translate("msg")),),
      ),
    );
  }
}
