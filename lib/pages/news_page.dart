import 'package:flutter/material.dart';

class NewsItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String tag;

  const NewsItem({
	required this.title,
	required this.subtitle,
	required this.imageUrl,
	required this.tag,
  });
}


class NewsPage extends StatelessWidget {
const NewsPage({super.key});


List<NewsItem> get _items => List.generate(8, (i) => NewsItem(
title: 'Judul Berita ${i+1}',
subtitle: 'Ringkasan singkat berita ${i+1} yang sifatnya statis untuk contoh layout.',
imageUrl: 'https://picsum.photos/seed/news$i/500/300',
tag: i.isEven ? 'Teknologi' : 'Kampus',
));


@override
Widget build(BuildContext context) {
return ListView.builder(
padding: const EdgeInsets.all(12),
itemCount: _items.length,
itemBuilder: (context, i) {
final n = _items[i];
return Card(
clipBehavior: Clip.antiAlias,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
margin: const EdgeInsets.only(bottom: 12),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
AspectRatio(
aspectRatio: 16/9,
child: Image.network(n.imageUrl, fit: BoxFit.cover),
),
Padding(
padding: const EdgeInsets.all(12.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Chip(label: Text(n.tag)),
const Spacer(),
IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border))
],
),
Text(n.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
const SizedBox(height: 6),
Text(n.subtitle, style: TextStyle(color: Colors.grey.shade700)),
],
),
)
],
),
);
},
);
}
}