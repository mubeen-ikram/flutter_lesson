import '../ApiClient/ApiClient.dart';
import '../Model/User.dart';

class UserRepository {
  RestClient restClient;

  UserRepository(this.restClient);

  Future<List<User>> getUserList({required int page}) async {
    try {
      var response = await restClient.getTasks(page);
      if (response.data != null) {
        return Future.value(response.data);
      }
      return Future.error(Exception(response.toString()));
    } catch (error) {
      return Future.error(error);
    }
  }
}
