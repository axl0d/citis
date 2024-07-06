import 'package:citis/models.dart';
import 'package:citis/widgets/full_agenda_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../theme.dart';

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
      appBar: AppBar(
        leading: Image.asset("assets/logo_tiny.png"),
        actions: [
          IconButton(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (_) => const Dialog.fullscreen(
                child: _FilterScreen(),
              ),
            ),
            icon: SvgPicture.asset("assets/svg/ic_filter.svg"),
          ),
        ],
      ),
      body: bodies.elementAt(_currentIndex),
      bottomNavigationBar: NavigationBar(
        backgroundColor: background,
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        indicatorShape: const CircleBorder(),
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset("assets/svg/ic_home.svg"),
            label: 'Inicio',
          ),
          const NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Agenda',
          ),
        ],
      ),
    );
  }
}

class _FilterScreen extends StatelessWidget {
  const _FilterScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Topic",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const Gap(8),
          for (final tracks in TechnicalTrack.values) ...[
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              controlAffinity: ListTileControlAffinity.leading,
              value: false,
              onChanged: (_) {},
              title: Text(
                tracks.inSpanish,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Gap(8),
          ],
        ],
      ),
    );
  }
}

class _AgendaView extends StatefulWidget {
  const _AgendaView();

  @override
  State<_AgendaView> createState() => _AgendaViewState();
}

class _AgendaViewState extends State<_AgendaView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Completa',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Mi agenda',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const Gap(8),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                FullAgendaBody(),
                Center(
                  child: Text("No hay workshops agregados"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
