import 'package:citis/dumb_data.dart';
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
  _HomeView(),
  _AgendaView(),
];

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final workshops = jul17[1].workshops!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(8),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                Card(
                  color: r2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset("assets/white_ups_logo.png"),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/images/in_site_1.JPG",
                    fit: BoxFit.cover,
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/images/in_site_2.JPG",
                    fit: BoxFit.cover,
                  ),
                ),
                Card(
                  color: r3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              "Next Session",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const Divider(),
          for (final workshop in workshops) ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: NextSessionItem(workshop: workshop),
            ),
            const Divider(),
          ]
        ],
      ),
    );
  }
}

class NextSessionItem extends StatelessWidget {
  const NextSessionItem({
    super.key,
    required this.workshop,
  });

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(workshop.title),
        const Gap(8),
        Text(workshop.speakersFlat),
        const Gap(8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Jul 17",
            ),
            Text(
              "Salon 123",
            ),
          ],
        )
      ],
    );
  }
}

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
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => states.contains(WidgetState.selected)
                ? const TextStyle(color: primary)
                : const TextStyle(color: tertiary),
          ),
        ),
        child: NavigationBar(
          backgroundColor: background,
          selectedIndex: _currentIndex,
          onDestinationSelected: _onItemTapped,
          indicatorShape: const CircleBorder(),
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset("assets/svg/ic_home.svg"),
              selectedIcon: SvgPicture.asset(
                "assets/svg/ic_home.svg",
                color: primary,
              ),
              label: 'Inicio',
            ),
            const NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Agenda',
            ),
          ],
        ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          const Gap(8),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text("Clear"),
            ),
          ),
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
