import 'package:flutter_test/flutter_test.dart';
import 'package:user_http_example/counter.dart';

void main() {
  //arrange
  late Counter counter;
  setUp(() {
    counter = Counter();
  });

  test(
      'Given counter class When instantiation Then the value of count should be 0',
      () {
    //act
    final val = counter.count;
    //assert
    expect(val, 0);
  });

  test('Given counter class When increment Then the value of count should be 1',
      () {
    //act
    counter.incrementCount();
    final val = counter.count;
    //assert
    expect(val, 1);
  });

  test(
      'Given counter class When decrement Then the value of count should be -1',
      () {
    //act
    counter.decrementCount();
    final val = counter.count;
    //assert
    expect(val, -1);
  });

  test('Given counter class When reset Then the value of count should be 0',
      () {
    //act
    counter.resetCount();
    final val = counter.count;
    //assert
    expect(val, 0);
  });
}
