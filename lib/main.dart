import 'package:citis/workshop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const appName = "Citis";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appName),
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
  int _currentIndex = 0;

  final bodies = [
    const Center(child: Text('Home')),
    ListView(
      children: <Widget>[
        for (final workshop in workshops) _WorkshopCard(workshop: workshop)
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: bodies.elementAt(_currentIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Agenda',
          ),
        ],
      ),
    );
  }
}

class _WorkshopCard extends StatelessWidget {
  const _WorkshopCard({
    required this.workshop,
  });

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Workshop',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(workshop.title),
            ],
          ),
          subtitle: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Ponente:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const WidgetSpan(child: SizedBox(width: 4)),
                TextSpan(text: workshop.speaker.fullTitle),
              ],
              style: const TextStyle(color: Colors.black),
            ),
          ),
          trailing: IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {},
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _WorkshopDetailPage(workshop: workshop),
          ),
        ),
      ),
    );
  }
}

class _WorkshopDetailPage extends StatelessWidget {
  const _WorkshopDetailPage({
    required this.workshop,
  });

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: workshop.topic.color,
        title: const Text("Workshop"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Título",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              workshop.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.person_outlined),
                const SizedBox(width: 4),
                Text(workshop.speaker.fullTitle),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "Categoría",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Chip(
              label: Text(workshop.topic.inSpanish),
              backgroundColor: workshop.topic.color,
            ),
            const SizedBox(height: 4),
            Text(workshop.location),
          ],
        ),
      ),
    );
  }
}
