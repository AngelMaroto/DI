import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    main();
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: obtener(),
          builder: (context, snapshot) {
            var posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                var post = posts[index];
                return ListTile(
                  leading: post['id'],
                  title: post['title'],
                  subtitle: post['body'],
                  trailing: post['userId'],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<dynamic>> obtener() async {
    var json = await rootBundle.loadString('assets/Json.JSON');
    return jsonDecode(json) as List;
  }
}
