import 'package:citis/main.dart';
import 'package:flutter/material.dart';

import '../workshop.dart';
import 'workshop_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const bodies = [
  Center(child: Text('Home')),
  _AgendaView(),
];

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(appName),
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

class _AgendaView extends StatelessWidget {
  const _AgendaView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SegmentedButton(
          selected: const <Agenda>{Agenda.full},
          segments: const <ButtonSegment<Agenda>>[
            ButtonSegment(
              value: Agenda.full,
              label: Text("Completa"),
            ),
            ButtonSegment(
              value: Agenda.user,
              label: Text("Mi agenda"),
            ),
          ],
        ),
        SegmentedButton(
          segments: const <ButtonSegment<int>>[
            ButtonSegment(
              value: 0,
              label: Text("27"),
            ),
            ButtonSegment(
              value: 1,
              label: Text("28"),
            ),
            ButtonSegment(
              value: 2,
              label: Text("29"),
            ),
          ],
          selected: const <int>{0},
        ),
        for (final workshop in workshops) _WorkshopCard(workshop: workshop)
      ],
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
            builder: (context) => WorkshopDetailPage(workshop: workshop),
          ),
        ),
      ),
    );
  }
}
