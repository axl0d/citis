import 'package:citis/main.dart';
import 'package:flutter/material.dart';

import '../models.dart';
import '../widgets/full_agenda_body.dart';

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
      backgroundColor: background,
      appBar: AppBar(title: const Text(appName)),
      body: bodies.elementAt(_currentIndex),
      bottomNavigationBar: NavigationBar(
        backgroundColor: background,
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SegmentedButton(
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
        ),
        const FullAgendaBody(),
      ],
    );
  }
}
