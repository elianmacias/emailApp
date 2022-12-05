import 'package:flutter/material.dart';
import '../model/email.dart';
import '../widgets/emailWidget.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.email, {super.key});

  final Email email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(email.subject),
        ),
        body: EmailWidget(email));
  }
}
