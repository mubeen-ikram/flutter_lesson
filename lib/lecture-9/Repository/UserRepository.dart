import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../ApiClient/ApiClient.dart';
import '../Model/User.dart';

class UserRepository {
  RestClient restClient;
  Database? database;

  UserRepository(this.restClient);

  UserRepository.UserREpository(this.restClient) {
    // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
    setDatabase();
  }

  List<User>? currentUsers;

  Future<List<User>> getUserList() async {
    try {
      if (currentUsers != null) return Future.value(currentUsers);

      var response = await restClient.getUsers();
      currentUsers = response.data.toList();
      if (database != null) {
        setupDataInDatabase(response.data);
      }
      return Future.value(response.data);
    } catch (error) {
      if (error is DioException) {
        return getUserDatabaseList();
      }
      return Future.error(error);
    }
  }

  Future<List<User>> getUserDatabaseList() async {
    try {
      // Query the table for all The Dogs.
      final List<Map<String, Object?>>? maps = await database?.query('users');
      if (maps == null) return Future.error("Users not found");

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return User(
          maps[i]['id'] as int,
          "${maps[i]['email'] as String} from database",
          maps[i]['avatar'] as String,
          "${maps[i]['first_name'] as String} from database",
          maps[i]['last_name'] as String,
        );
      });
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<void> setDatabase() async {
    openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        join(await getDatabasesPath(), 'user_database.db'),
        version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, avatar TEXT,first_name Text, last_name TEXT)',
      );
    }).then((value) => database = value);
  }

  void setupDataInDatabase(List<User> data) {
    data.forEach((element) async {
      await database!.insert(
        'users',
        element.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }
}
