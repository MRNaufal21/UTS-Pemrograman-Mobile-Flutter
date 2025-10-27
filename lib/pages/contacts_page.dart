import 'package:flutter/material.dart';


class Contact {
final String name;
final String phone;
const Contact(this.name, this.phone);
}


class ContactsPage extends StatelessWidget {
const ContactsPage({super.key});


List<Contact> get _data => const [
Contact('Aisyah Putri', '0812-1111-0001'),
Contact('Budi Santoso', '0812-1111-0002'),
Contact('Citra Lestari', '0812-1111-0003'),
Contact('Deni Pratama', '0812-1111-0004'),
Contact('Eka Ramadhan', '0812-1111-0005'),
Contact('Farah Zahra', '0812-1111-0006'),
Contact('Gilang Akbar', '0812-1111-0007'),
Contact('Hana Safitri', '0812-1111-0008'),
Contact('Indra K', '0812-1111-0009'),
Contact('Joko W', '0812-1111-0010'),
Contact('Kirana', '0812-1111-0011'),
Contact('Lutfi', '0812-1111-0012'),
Contact('Maya', '0812-1111-0013'),
Contact('Naufal', '0812-1111-0014'),
Contact('Putra', '0812-1111-0015'),
];


Color _avatarColor(BuildContext context, int index) {
final colors = [
Colors.indigo, Colors.blue, Colors.teal, Colors.green, Colors.orange, Colors.pink, Colors.purple
];
return colors[index % colors.length];
}


@override
Widget build(BuildContext context) {
return ListView.separated(
padding: const EdgeInsets.all(12),
itemBuilder: (context, i) {
final c = _data[i];
return ListTile(
leading: CircleAvatar(
backgroundColor: _avatarColor(context, i),
child: Text(c.name.substring(0, 1), style: const TextStyle(color: Colors.white)),
),
title: Text(c.name, style: const TextStyle(fontWeight: FontWeight.w600)),
subtitle: Text(c.phone),
trailing: const Icon(Icons.chevron_right),
onTap: () {},
);
},
separatorBuilder: (_, __) => const Divider(height: 0),
itemCount: _data.length,
);
}
}