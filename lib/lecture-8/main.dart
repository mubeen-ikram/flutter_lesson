import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_example/lecture-8/Repository/UserRepository.dart';
import 'ApiClient/ApiClient.dart';
import 'Model/User.dart';

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late UserRepository userRepository;
  late RestClient restClient;
  late int currentPage;
  late bool isLoading;
  late List<User> userList;

  @override
  void initState() {
    // TODO: implement initState
    Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.interceptors.add(PrettyDioLogger());
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
    currentPage = 1;
    isLoading = false;
    userList = [];
    fetchData();
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
        body: _buildBody(),
      ),
    );
  }
  Future<void> fetchData() async {
    try {
      setState(() {
        isLoading = true;
      });
      final List<User> newData = await userRepository.getUserList(page: currentPage);
      setState(() {
        userList.addAll(newData);
        currentPage++;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error
      print('Error fetching data: $e');
    }
  }
  Widget _buildBody() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (!isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          fetchData();
        }
        return true;
      },
      child: _buildPosts(),
    );
  }

  Widget _buildPosts() {
    return ListView.builder(
      itemCount: userList.length + 1,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        if (index < userList.length) {
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(
                userList[index].first_name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(userList[index].email),
              leading: Column(
                children: <Widget>[
                  Image.network(
                    userList[index].avatar,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
