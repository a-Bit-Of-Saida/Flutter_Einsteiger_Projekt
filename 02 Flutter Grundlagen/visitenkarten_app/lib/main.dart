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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  Future<void> openLinkedIn() async {
    final Uri linkedin = Uri.parse('https://www.linkedin.com/in/saida-covrk/');
    await launchUrl(linkedin, mode: LaunchMode.externalApplication);
  }

  Widget buildHomePage() {
    return Padding(
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text('Wirtschaftsinformatik Studentin'),
                  const Text('@ University of Applied Sciences'),
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
    );
  }

  Widget buildSkillsPage() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.code, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Programmiersprachen',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Dart'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Java'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('SQL'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.build, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Backend & Infrastruktur',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Spring Boot'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('RabbitMQ'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Tableau / Power BI'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('ArchiMate'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProjectPage() {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.code),
                  title: Text('BSRN'),
                  subtitle: Text('UDP Peer-to-Peer Chat'),
                ),
                TextButton(onPressed: null, child: Text('GitHub Repo')),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.web),
                  title: Text('Web Projekt'),
                  subtitle: Text('React / Spring Boot Projekt'),
                ),
                TextButton(onPressed: null, child: Text('GitHub Repo')),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.smart_toy),
                  title: Text('AI Projekt'),
                  subtitle: Text('Kleines KI-Projekt'),
                ),
                TextButton(onPressed: null, child: Text('GitHub Repo')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      buildHomePage(),
      buildSkillsPage(),
      buildProjectPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Skills'),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'Projekte'),
        ],
      ),
    );
  }
}
