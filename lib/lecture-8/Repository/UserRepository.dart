import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../ApiClient/ApiClient.dart';
import '../Model/User.dart';

class UserRepository {
  RestClient restClient;

  UserRepository(this.restClient);



  List<User>? currentUsers;

  Future<List<User>> getUserList() async {
    try {
      if (currentUsers != null) return Future.value(currentUsers);

      var response = await restClient.getUsers();
      if (response.data != null) {
        currentUsers = response.data.toList();
        return Future.value(response.data);
      }
      return Future.error(Exception(response.support));
    } catch (error) {
      return Future.error(error);
    }
  }
}
