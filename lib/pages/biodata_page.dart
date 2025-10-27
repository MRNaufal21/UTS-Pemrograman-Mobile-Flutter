import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaC = TextEditingController(text: 'Muhammad Rizqi Naufal');
  final _nimC = TextEditingController(text: '152019043');
  final _alamatC = TextEditingController();

  String _gender = 'Laki-laki';
  String _prodi = 'Teknik Informatika';
  DateTime? _tanggalLahir;

  @override
  void dispose() {
    _namaC.dispose();
    _nimC.dispose();
    _alamatC.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 20),
      firstDate: DateTime(1970),
      lastDate: now,
    );
    if (result != null) setState(() => _tanggalLahir = result);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/kiki.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Profil Mahasiswa',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _namaC,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Nama wajib diisi' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nimC,
                  decoration: const InputDecoration(
                    labelText: 'NIM',
                    prefixIcon: Icon(Icons.numbers),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'NIM wajib diisi' : null,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _prodi,
                  items: const [
                    DropdownMenuItem(
                      value: 'Teknik Informatika',
                      child: Text('Teknik Informatika'),
                    ),
                    DropdownMenuItem(
                      value: 'Sistem Informasi',
                      child: Text('Sistem Informasi'),
                    ),
                    DropdownMenuItem(
                      value: 'Teknik Elektro',
                      child: Text('Teknik Elektro'),
                    ),
                    DropdownMenuItem(
                      value: 'Teknik Industri',
                      child: Text('Teknik Industri'),
                    ),
                  ],
                  onChanged: (v) => setState(() => _prodi = v!),
                  decoration: const InputDecoration(
                    labelText: 'Program Studi',
                    prefixIcon: Icon(Icons.school),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text('Jenis Kelamin: '),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Laki-laki'),
                        value: 'Laki-laki',
                        groupValue: _gender,
                        onChanged: (v) => setState(() => _gender = v!),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Perempuan'),
                        value: 'Perempuan',
                        groupValue: _gender,
                        onChanged: (v) => setState(() => _gender = v!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _alamatC,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    prefixIcon: Icon(Icons.home),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Tanggal Lahir',
                          prefixIcon: Icon(Icons.cake),
                        ),
                        child: Text(
                          _tanggalLahir == null
                              ? 'Belum dipilih'
                              : '${_tanggalLahir!.day}/${_tanggalLahir!.month}/${_tanggalLahir!.year}',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: _pickDate,
                      icon: const Icon(Icons.date_range),
                      label: const Text('Pilih'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data biodata disubmit!')),
                      );
                    }
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Kirim'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
