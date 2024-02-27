import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyButtonAnime(title: 'Button Animation'),
    );
  }
}

class MyButtonAnime extends StatefulWidget {
  const MyButtonAnime({super.key, required this.title});

  final String title;

  @override
  State<MyButtonAnime> createState() => _MyButtonAnimeState();
}

class _MyButtonAnimeState extends State<MyButtonAnime>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _controller.forward();
                  _isTapped = true;
                });
              },
              child: Lottie.asset(
                'assets/wavebutton.json',
                controller: _controller,
              ),
            ),
            Switch(
              value: _isTapped,
              onChanged: (value) {
                setState(() {
                  _isTapped = value;
                  if (!_isTapped) {
                    _controller.reset(); // Reset the animation
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
