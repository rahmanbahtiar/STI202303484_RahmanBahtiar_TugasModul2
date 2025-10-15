import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> produk;

  DetailPage({required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              produk['nama']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(produk['deskripsi']!, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(
              'Harga: Rp ${produk['harga']}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
