import 'package:ejemplo_5_3/main.dart';
import 'package:flutter_test/flutter_test.dart';



void main(){
  test("aumenta el contador", (){
    final pageState = MyHomePageState();
    pageState.incrementCounter();
    expect(pageState.counter, 1);
  });
}