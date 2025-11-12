import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostListScreen(),
  ));
}

// Simula los datos del endpoint posts de JSONPlaceholder
class Post {
  final int id;
  final String title;
  final String body;
  final String author;

  Post(
      {required this.id,
      required this.title,
      required this.body,
      required this.author});
}

final List<Post> posts = [
  Post(
      id: 1,
      title: "Primer Post",
      body: "Este es el texto del primer post, con información interesante.",
      author: "Juan Pérez"),
  Post(
      id: 2,
      title: "Segundo Post",
      body: "Aquí viene la información del segundo post, más detalles y ejemplos.",
      author: "Ana López"),
  Post(
      id: 3,
      title: "Tercer Post",
      body: "Un tercer mensaje para mostrar cuántos posts tenemos.",
      author: "Pepe García"),
];

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          final post = posts[i];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Por: ${post.author}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostDetailScreen(post: post),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalles del Post")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(height: 14),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Text(post.author,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 22),
                Text(post.body, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
