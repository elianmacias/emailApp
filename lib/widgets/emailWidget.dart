import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/email.dart';

class EmailWidget extends StatelessWidget {
  EmailWidget(this.email, {super.key});

  final Email email;
  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'From: ${email.from}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          height: 30,
          thickness: 0.5,
          color: Colors.blue,
        ),
        Text(email.subject),
        const Divider(
          height: 5,
          color: Colors.transparent,
        ),
        Text(
          formatter.format(email.dateTime),
          style: const TextStyle(color: Colors.grey),
        ),
        const Divider(
          height: 30,
          thickness: 0.5,
          color: Colors.blue,
        ),
        Text(email.body),
      ]),
    );
  }
}
