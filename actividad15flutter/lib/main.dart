import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserProfileScreen(),
  ));
}

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String userName = "Juan Pérez";
  String userEmail = "juan.perez@email.com";

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = userName;
    emailController.text = userEmail;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 48;
    return Scaffold(
      appBar: AppBar(title: Text("Perfil de Usuario")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Imagen de portada (puedes usar Image.network para una URL)
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/portada.jpg'), // O usa NetworkImage/Colors.blue
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: -avatarRadius / 2,
                  child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                ),
                Positioned(
                  left: 16 + avatarRadius * 2 + 16,
                  bottom: 12,
                  right: 16,
                  child: Text(
                    userName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: avatarRadius / 2 + 24),
            Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: "Nombre"),
                      validator: (val) =>
                        val == null || val.trim().isEmpty ? "Introduce tu nombre" : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Correo"),
                      validator: (val) =>
                        val == null || val.trim().isEmpty ? "Introduce el correo" : null,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            userName = nameController.text;
                            userEmail = emailController.text;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("¡Perfil actualizado!")),
                          );
                        }
                      },
                      child: Text("Guardar"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 44, vertical: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
