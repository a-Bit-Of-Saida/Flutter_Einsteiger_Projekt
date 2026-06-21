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
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  String setup = '';
  String punchline = '';
  bool isLoading = false;
  String quote = '';
  String author = '';

  Future<void> openLinkedIn() async {
    final Uri linkedin = Uri.parse('https://www.linkedin.com/in/saida-covrk/');
    await launchUrl(linkedin, mode: LaunchMode.externalApplication);
  }

  Future<void> ladeWitz() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://official-joke-api.appspot.com/random_joke');

    final response = await http.get(url);

    final data = jsonDecode(response.body);

    setState(() {
      setup = data['setup'];
      punchline = data['punchline'];
      isLoading = false;
    });
  }

  Future<void> ladeZitat() async {
    setState(() {
      isLoading = true;
    });

    final url2 = Uri.parse('https://dummyjson.com/quotes/random');

    final response2 = await http.get(url2);

    final data2 = jsonDecode(response2.body);

    setState(() {
      quote = data2['quote'];
      author = data2['author'];
      isLoading = false;
    });
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
    return SingleChildScrollView(
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
                          child: Text('Java'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Python'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Dart'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('SQL'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('JavaScript'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

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

          SizedBox(height: 16),

          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.computer, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Microsoft-Software',
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
                          child: Text('Word'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('PowerPoint'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Excel'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Outlook'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Teams'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('OneNote'),
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
                      Icon(Icons.web, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Frontend & Web',
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
                          child: Text('HTML'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('CSS'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('JavaScript'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('React'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),

          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.storage, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Backend Development',
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
                          child: Text('REST APIs'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('GraphQL'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('JSON'),
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
                      Icon(Icons.hub, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Integration & Messaging',
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
                          child: Text('RabbitMQ'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Middleware'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Event-Driven'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('API Integration'),
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
                      Icon(Icons.storage, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Database',
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
                          child: Text('SQL'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Data Warehousing'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('ETL'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('OLAP'),
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
                      Icon(Icons.bar_chart, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Business Intelligence',
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
                          child: Text('Power BI'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Tableau'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Reporting'),
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
                      Icon(Icons.account_tree, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Enterprise Architecture',
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
                          child: Text('ArchiMate'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('BPMN'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('System Design'),
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
                      Icon(Icons.smart_toy, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Automation & RPA',
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
                          child: Text('UiPath'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Automation'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Excel Automation'),
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
                      Icon(Icons.settings, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'DevOps & Tooling',
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
                          child: Text('Git'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('GitHub'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('GitLab'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Maven'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Gradle'),
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
                      Icon(Icons.bug_report, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Testing & QA',
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
                          child: Text('Maestro'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('UI Testing'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Debugging'),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('QA'),
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
    return Padding(
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
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(label: Text('Python')),
                    Chip(label: Text("Tkinter")),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(
                      'https://github.com/a-Bit-Of-Saida/BSRN-Gruppenaufgabe',
                    );
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  child: Text('GitHub Repo'),
                ),
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

  Widget buildJokePage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Witz des Tages',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: ladeWitz,
              child: const Text('Witz laden'),
            ),

            const SizedBox(height: 16),

            if (isLoading)
              const CircularProgressIndicator()
            else if (setup.isNotEmpty)
              Column(
                children: [
                  Text(setup, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text(
                    punchline,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

            const SizedBox(height: 32),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Zitat des Tages',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: ladeZitat,
                      child: const Text('Zitat laden'),
                    ),

                    const SizedBox(height: 16),

                    if (isLoading)
                      const CircularProgressIndicator()
                    else if (quote.isNotEmpty)
                      Column(
                        children: [
                          Text(author, textAlign: TextAlign.center),

                          const SizedBox(height: 8),

                          Text(
                            quote,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
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

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      buildHomePage(),
      buildSkillsPage(),
      buildProjectPage(),
      buildJokePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions),
            label: 'Witz',
          ),
        ],
      ),
    );
  }
}
