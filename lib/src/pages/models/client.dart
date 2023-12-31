import 'package:flutter/material.dart';




// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  String? id;
  String? username;
  String? email;
  String? password;

  Client({
    this.id,
    this.username,
    this.email,
    this.password,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
   // "password": password,
  };
}
