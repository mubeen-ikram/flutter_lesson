import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../Model/BaseResponse/BaseResponse.dart';
import '../Model/User.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: "https://reqres.in/api/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/users?page=1")
  Future<BaseResponse<List<User>>> getUsers();
}
