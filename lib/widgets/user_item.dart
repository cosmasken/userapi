import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  final String name;

  const UserItem({Key? key, required this.name}) : super(key: key);

  @override
  _UserItemState createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
          title: Text(widget.name, textAlign: TextAlign.center), dense: true),
    );
  }
}
