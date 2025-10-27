import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final String city = 'Jakarta';
  final String condition = 'Cerah';
  final int temp = 30;

  @override
  void initState() {
	super.initState();
	_controller = AnimationController(
	  vsync: this,
	  duration: const Duration(seconds: 6),
	)..repeat();
  }

  @override
  void dispose() {
	_controller.dispose();
	super.dispose();
  }

  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  appBar: AppBar(
		title: const Text('Weather'),
	  ),
	  body: Center(
		child: Column(
		  mainAxisAlignment: MainAxisAlignment.center,
		  children: [
			Text(city, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
			const SizedBox(height: 8),
			Text('$condition', style: TextStyle(color: Colors.grey.shade700)),
			const SizedBox(height: 20),
			Stack(
			  alignment: Alignment.center,
			  children: [
				RotationTransition(
				  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
				  child: Icon(Icons.wb_sunny, size: 120, color: Colors.amber.shade600),
				),
				Positioned(
				  right: 24,
				  child: Icon(Icons.cloud, size: 100, color: Colors.blueGrey.shade300),
				),
			  ],
			),
			const SizedBox(height: 20),
			Text('$temp°C', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w700)),
			const SizedBox(height: 8),
			Wrap(
			  alignment: WrapAlignment.center,
			  spacing: 16,
			  runSpacing: 8,
			  children: const [
				_WeatherChip(icon: Icons.water_drop, label: 'Kelembapan', value: '78%'),
				_WeatherChip(icon: Icons.air, label: 'Angin', value: '2.5 m/s'),
				_WeatherChip(icon: Icons.thermostat, label: 'Suhu Terasa', value: '25°C'),
			  ],
			),
		  ],
		),
	  ),
	);
  }
}

class _WeatherChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherChip({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
	return Chip(
	  avatar: Icon(icon),
	  label: Text('$label: $value'),
	  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
	);
  }
}