import 'package:userapi/model/address.dart';
import 'package:userapi/model/company.dart';

class User {
  late int id;
  late String name;
  late String username;
  late String email;
  late Address address;
  late String phone;
  late String website;
  late Company company;

  User(
      {required this.id,
        required this.name,
        required this.username,
        required this.email,
        required  this.address,
        required  this.phone,
        required  this.website,
        required  this.company});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
    (json['address'] != null ? new Address.fromJson(json['address']) : null)!;
    phone = json['phone'];
    website = json['website'];
    company =
    (json['company'] != null ? new Company.fromJson(json['company']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    return data;
  }
}