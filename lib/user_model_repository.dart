import 'package:user_http_example/user_model.dart';
import 'package:http/http.dart' as http;

class UserModelRepository {
  final http.Client client;
  UserModelRepository(this.client);
  Future<UserModel> getUser() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    }
    throw Exception('some error occurred');
  }
}
