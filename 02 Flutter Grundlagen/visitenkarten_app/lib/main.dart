/* Projekt 1: Visitenkarten-App
Ziel

Eine einfache persönliche Profilseite.

Anforderungen

Die App zeigt:

Name
Studiengang/Beruf
Profilbild oder Icon
E-Mail
Telefonnummer
3 Skills
Button „Kontaktieren“
Technische Anforderungen

Du nutzt:

Scaffold
Column
Row
Text
Icon
Container
Padding
Card

 */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visitenkarten App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 60, 167, 197),
        ),
      ),
      home: const MyHomePage(title: 'Visitenkarten App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  Future<void> openLinkedIn() async {
    final Uri linkedin = Uri.parse('https://www.linkedin.com/in/saida-covrk/');

    await launchUrl(linkedin, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.person, size: 60),
                    const Text(
                      'Saida Covrk',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const ListTile(
                      leading: Icon(Icons.email),
                      title: Text('E-Mail'),
                      subtitle: Text('saida@covrk.de'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.code),
                      title: Text('Beruf'),
                      subtitle: Text('Flutter App Developer'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.school),
                      title: Text('Studiengang'),
                      subtitle: Text('Wirtschaftsinformatik'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Telefonnummer'),
                      subtitle: Text('+49 176 123456'),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: openLinkedIn,
                      child: const Text('LinkedIn'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
