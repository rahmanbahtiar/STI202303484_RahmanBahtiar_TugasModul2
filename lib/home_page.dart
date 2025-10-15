import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _hargaController = TextEditingController();

  List<Map<String, String>> produkList = [];

  void _simpanProduk() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        produkList.add({
          'nama': _namaController.text,
          'deskripsi': _deskripsiController.text,
          'harga': _hargaController.text,
        });
        _namaController.clear();
        _deskripsiController.clear();
        _hargaController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama Produk'),
                    validator: (value) =>
                        value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                  ),
                  TextFormField(
                    controller: _deskripsiController,
                    decoration: InputDecoration(labelText: 'Deskripsi'),
                    validator: (value) =>
                        value!.isEmpty ? 'Deskripsi tidak boleh kosong' : null,
                  ),
                  TextFormField(
                    controller: _hargaController,
                    decoration: InputDecoration(labelText: 'Harga'),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Harga tidak boleh kosong' : null,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _simpanProduk,
                    child: Text('Simpan Produk'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: produkList.length,
                itemBuilder: (context, index) {
                  final produk = produkList[index];
                  return Card(
                    child: ListTile(
                      title: Text(produk['nama']!),
                      subtitle: Text('Rp ${produk['harga']}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(produk: produk),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
