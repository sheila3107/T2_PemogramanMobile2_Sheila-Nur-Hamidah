import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile Card App', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 10),
            Text(
              'Aplikasi ini menampilkan profil sederhana dengan opsi untuk mengedit informasi seperti nama, email, dan nomor telepon. '
              'Kamu juga bisa mengganti tema antara mode terang, gelap, atau mengikuti pengaturan sistem.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text('Dibuat oleh: Tekno Team', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
