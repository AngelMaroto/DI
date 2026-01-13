import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ejemplo_5_3/main.dart';

void main(){
  testWidgets("El textos funcionan correctamente", (WidgetTester tester)async{

    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Flutter Demo Home Page'), findsOneWidget);


  } );

  testWidgets("El boton funciona correctamente", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    MaterialApp(
      home: Scaffold(
        body: MyHomePage(
          title: "Prueba"),
      ),
    );
    
    tester.tap(find.byType(FloatingActionButton));



  });
}