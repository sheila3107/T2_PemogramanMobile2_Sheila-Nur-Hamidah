import 'package:flutter/material.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Tekno';
  String title = 'Scrolling Engineer';
  String description = 'Scrol Fesnuk, Yapping';
  String email = 'tekno@test.com';
  String phone = '+62 812 3456 7890';
  final String imageUrl = 'assets/images/logo.png';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = name;
    _emailController.text = email;
    _phoneController.text = phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(imageUrl, width: 100),
                  SizedBox(height: 16),
                  Text(name, style: Theme.of(context).textTheme.titleLarge),
                  Text(title, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Text(description, textAlign: TextAlign.center),
                  Divider(height: 30),
                  Text('Email: $email'),
                  Text('Telepon: $phone'),
                  SizedBox(height: 24),

                  // 🔤 Form Edit
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Nama'),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(labelText: 'Telepon'),
                        ),
                        SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              name = _nameController.text;
                              email = _emailController.text;
                              phone = _phoneController.text;
                            });
                          },
                          child: Text('Simpan Perubahan'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: Icon(Icons.info_outline),
                    label: Text('Tentang Aplikasi'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
