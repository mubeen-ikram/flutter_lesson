import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_example/lecture-6/Model/Product.dart';
import 'package:project_example/lecture-8/Repository/UserRepository.dart';

import 'ApiClient/ApiClient.dart';
import 'Model/Post.dart';
import 'Model/User.dart';

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late UserRepository userRepository;
  late RestClient restClient;

  @override
  void initState() {
    // TODO: implement initState
    Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final client = RestClient(dio);
    userRepository = UserRepository(client);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrofit',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: const Text(
            'Flutter Retrofit',
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }

  FutureBuilder<List<User>> _buildBody(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: userRepository.getUserList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<User> posts = snapshot.data!;
          return _buildPosts(context, posts);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<User> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].first_name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].email),
            leading: Column(
              children: <Widget>[
                Image.network(
                  posts[index].avatar,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
