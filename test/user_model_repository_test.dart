import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_http_example/user_model.dart';
import 'package:user_http_example/user_model_repository.dart';

//mocking
class MockHttpClient extends Mock implements Client {}

void main() {
  //arrange
  late UserModelRepository userModelRepository;
  late MockHttpClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockHttpClient();
    userModelRepository = UserModelRepository(mockHttpClient);
  });
  group('UserModelRepository Class - ', () {
    group('getUser function - ', () {
      test(
          'Given UserModelRepository class When the getUser method is called and status code is 200 Then UserModel should be returned',
          () async {
        //arrange
        //Stub and Verify Behavior
        when(() => mockHttpClient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer((invocation) async => Response(
                  '''{
                    "id": 1,
                    "name": "Leanne Graham",
                    "email": "Sincere@april.biz",
                    "website": "hildegard.org"
                  }''',
                  200,
                ));
        //act
        final user = await userModelRepository.getUser();
        //assert
        expect(user, isA<UserModel>());
      });
    });
    test(
        'Given UserModelRepository class When the getUser method is called and status code is not 200 Then Exception should be thrown',
        () async {
      //arrange
      //stubbing
      when(() => mockHttpClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
          .thenAnswer((invocation) async => Response('{}', 500));
      //act
      final user = userModelRepository.getUser();
      //assert
      expect(user, throwsException);
    });
  });
}
