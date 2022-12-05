import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/email.dart';
import '../model/backend.dart';
import 'detailScreen.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListScreenState();
  }
}

class ListScreenState extends State<ListScreen> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final Backend backend = Backend();
  var emails;

  @override
  Widget build(BuildContext context) {
    emails = backend.getEmails();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Mock Mail'),
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          Email email = emails[index];
          return Dismissible(
            key: Key(email.id.toString()),
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            onDismissed: (direction) {
              backend.deleteEmail(email.id);
              setState(() {
                emails = backend.getEmails();
              });
            },
            direction: DismissDirection.endToStart,
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                      contentPadding: const EdgeInsets.all(5),
                      horizontalTitleGap: 0,
                      trailing: Text(formatter.format(email.dateTime)),
                      title: Text(email.from,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(email.subject),
                      leading: email.read
                          ? const Icon(
                              Icons.check_rounded,
                              color: Colors.blue,
                              size: 30.0,
                            )
                          : const Icon(
                              Icons.brightness_1_rounded,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                      onTap: () {
                        backend.markEmailAsRead(email.id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(email)));

                        setState(() {
                          emails = backend.getEmails();
                        });
                      },
                      onLongPress: () {
                        backend.markEmailAsRead(email.id);
                        setState(() {
                          emails = backend.getEmails();
                        });
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
