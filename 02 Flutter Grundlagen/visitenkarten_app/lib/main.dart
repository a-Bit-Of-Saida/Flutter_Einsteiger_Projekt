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
          seedColor: const Color.fromARGB(255, 60, 167, 197),
        ),
      ),
      home: const MyHomePage(title: 'Visitenkarten App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, size: 60),
                    Text(
                      'Saida Covrk',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('E-Mail'),
                      subtitle: Text('saida@covrk.de'),
                    ),
                    ListTile(
                      leading: Icon(Icons.code),
                      title: Text('Beruf'),
                      subtitle: Text('Flutter App Developer'),
                    ),
                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text('Studiengang'),
                      subtitle: Text('Wirtschaftsinformatik'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Telefonnummer'),
                      subtitle: Text('+49 012 3456789'),
                    ),
                  ],
                ),
              ),
            ),
            const Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Text('Saida Covrk'),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.school),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Studiengang',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Text('Wirtschaftsinformatik'),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.work),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Beruf',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Text('App Developer'),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Telefonnummer',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Text('0176 123456'),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Text(
                    'E-Mail',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Text('saida@covrk.de'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
