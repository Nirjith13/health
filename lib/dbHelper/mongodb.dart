// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, non_constant_identifier_names, avoid_print

import 'dart:developer';

import 'package:hems/MongoDBModel.dart';
import 'package:hems/dbHelper/const.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static var db , userCollection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if(result.isSuccess){
        return "data inserted";
      } else {
        return "Something Wrong while inserting";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}