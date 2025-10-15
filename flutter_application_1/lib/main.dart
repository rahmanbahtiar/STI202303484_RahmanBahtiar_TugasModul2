import 'package:flutter/material.dart';

void main() {
  runApp(const TugasModul1App());
}

class TugasModul1App extends StatelessWidget {
  const TugasModul1App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Modul 1 - Rahman Bahtiar',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/hello': (_) => const HelloWorldPage(),
        '/column': (_) => const ColumnPage(),
        '/row': (_) => const RowPage(),
        '/state': (_) => const StateDemoPage(),
        '/form': (_) => const FormPage(),
        '/separate': (_) => const SeparateWidgetsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget menuTile(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Modul 1 - Rahman Bahtiar (STI202303484)'),
      ),
      body: ListView(
        children: [
          menuTile(context, '1. Membuat Hello World', '/hello'),
          menuTile(context, '2. Membuat Widget Column', '/column'),
          menuTile(context, '3. Membuat Widget Row', '/row'),
          menuTile(context, '4. StatelessWidget dan StatefulWidget', '/state'),
          menuTile(context, '5. Membuat Form', '/form'),
          menuTile(context, '6. Pemisahan Widget ke fungsi-fungsi', '/separate'),
        ],
      ),
    );
  }
}

/// 1. Hello World
class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello World')),
      body: const Center(
        child: Text(
          'Hello World!\nNama: Rahman Bahtiar\nNIM: STI202303484',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

/// 2. Column example
class ColumnPage extends StatelessWidget {
  const ColumnPage({Key? key}) : super(key: key);

  Widget _box(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18, color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Column')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          _box('Item 1', Colors.blue),
          _box('Item 2', Colors.green),
          _box('Item 3', Colors.orange),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ),
        ],
      ),
    );
  }
}

/// 3. Row example
class RowPage extends StatelessWidget {
  const RowPage({Key? key}) : super(key: key);

  Widget _circle(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blueAccent),
          child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 20))),
        ),
        const SizedBox(height: 8),
        Text('Label $label'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Row')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _circle('A'),
            _circle('B'),
            _circle('C'),
          ],
        ),
      ),
    );
  }
}

/// 4. Stateless vs Stateful
class StateDemoPage extends StatelessWidget {
  const StateDemoPage({Key? key}) : super(key: key);

  Widget _statelessCard() {
    return Card(
      child: ListTile(
        title: const Text('StatelessWidget'),
        subtitle: const Text('Teks statis; tidak menyimpan state.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless & Stateful')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _statelessCard(),
            const SizedBox(height: 12),
            const CounterStateful(),
          ],
        ),
      ),
    );
  }
}

class CounterStateful extends StatefulWidget {
  const CounterStateful({Key? key}) : super(key: key);

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

class _CounterStatefulState extends State<CounterStateful> {
  int _count = 0;

  void _inc() => setState(() => _count++);
  void _dec() => setState(() => _count--);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text('StatefulWidget (Counter)', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Count: $_count', style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _dec, child: const Text('-')),
                const SizedBox(width: 16),
                ElevatedButton(onPressed: _inc, child: const Text('+')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 5. Membuat Form
class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameCtrl.text;
      final email = _emailCtrl.text;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Data Diterima'),
          content: Text('Nama: $name\nEmail: $email'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
          ],
        ),
      );
    }
  }

  String? _validateNotEmpty(String? v) => (v == null || v.trim().isEmpty) ? 'Tidak boleh kosong' : null;
  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Tidak boleh kosong';
    final pattern = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!pattern.hasMatch(v)) return 'Format email salah';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Membuat Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nama lengkap'),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

/// 6. Pemisahan widget ke fungsi-fungsi
class SeparateWidgetsPage extends StatelessWidget {
  const SeparateWidgetsPage({Key? key}) : super(key: key);

  Widget header(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget infoCard(String title, String subtitle) {
    return Card(
      child: ListTile(title: Text(title), subtitle: Text(subtitle)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // contoh memisahkan UI menjadi fungsi-fungsi kecil
    return Scaffold(
      appBar: AppBar(title: const Text('Pemisahan Widget ke fungsi')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            header('Contoh header dari fungsi header()'),
            infoCard('Judul 1', 'Deskripsi singkat 1'),
            infoCard('Judul 2', 'Deskripsi singkat 2'),
            const Spacer(),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Selesai')),
          ],
        ),
      ),
    );
  }
}
