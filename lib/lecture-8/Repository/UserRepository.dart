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
      currentUsers = response.data.toList();
      return Future.value(response.data);
    } catch (error) {
      return Future.error(error);
    }
  }
}
