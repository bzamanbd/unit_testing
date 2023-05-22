import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_http_example/user_model.dart';
import 'package:user_http_example/user_model_repository.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<UserModel> getUsers = UserModelRepository(Client()).getUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getUsers,
          builder: (context, snapshort) {
            if (snapshort.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text('${snapshort.data}'),
              );
            }
          },
        ),
      ),
    );
  }
}
