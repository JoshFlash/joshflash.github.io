import 'package:flutter/material.dart';
import 'portfolio.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Josh Flash - Game Creator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Josh Flash - Game Creator'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('profile_picture.jpg'),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: SizedBox(
                  // set the max with
                  width: 540,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AutoSizeText(
                        "Hello, I'm Josh Flash, an innovative game developer from Auckland, New Zealand, passionate about crafting immersive experiences that inspire and connect players.",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      AutoSizeText(
                        "Driven by my belief in the transformative power of games, I combine creativity and technical expertise to push boundaries in the gaming industry. I am eager to contribute my skills to exciting new projects and collaborate with visionary teams.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      AutoSizeText(
                        "Explore my portfolio to see how my dedication to excellence and engaging storytelling can bring your gaming vision to life. Let's create memorable experiences together!",
                        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  // Navigate to the Portfolio Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PortfolioPage()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                ),
                child: const AutoSizeText(
                  'Explore My Portfolio',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
                const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
