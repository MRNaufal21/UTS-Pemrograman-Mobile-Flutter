import 'dart:async';
import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3F51B5), Color(0xFF1A237E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: const Icon(
                  Icons.flutter_dash,
                  size: 72,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Pemrograman Mobile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage('assets/kiki.png'),
              ),
              const SizedBox(height: 16),
              const Text(
                '152019043',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const Text(
                'Muhammad Rizqi Naufal',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.0),
                child: LinearProgressIndicator(
                  color: Colors.white70,
                  backgroundColor: Colors.white24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
