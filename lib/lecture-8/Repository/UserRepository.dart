import '../ApiClient/ApiClient.dart';
import '../Model/User.dart';

class UserRepository {
  RestClient restClient;

  UserRepository(this.restClient);

  Future<List<User>> getUserList() async {
    try {
      var response = await restClient.getTasks();
      if (response.data != null) {
        return Future.value(response.data);
      }
      return Future.error(Exception(response.responseMessage));
    } catch (error) {
      return Future.error(error);
    }
  }
}
