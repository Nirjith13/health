// To parse this JSON data, do
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromMap(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
    ObjectId id;
    String fullName;
    String email;
    String password;

    MongoDbModel({
        required this.id,
        required this.fullName,
        required this.email,
        required this.password,
    });

    factory MongoDbModel.fromMap(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        fullName: json["Full Name"],
        email: json["Email"],
        password: json["Password"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Full Name": fullName,
        "Email": email,
        "Password": password,
    };


}
