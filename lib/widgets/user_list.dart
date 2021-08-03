import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:userapi/model/user.dart';
import 'package:userapi/widgets/user_item.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var data;
  late List<User> users;

  Future<List<dynamic>> getData() async {
    Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List<dynamic>;
      return list;
    } else
      print(
          'Some error happened, here is the status code: ${response.statusCode}');
    final list = jsonDecode(response.body) as List<dynamic>;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getData(), // async work
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Loading....');
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return ListView.builder(

                  padding: const EdgeInsets.all(8),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    User user = User.fromJson(snapshot.data![index]);
                    return UserItem(name: user.name);

                  });
        }
      },
    );
  }
}
