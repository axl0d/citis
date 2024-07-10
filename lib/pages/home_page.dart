import 'package:citis/models.dart';
import 'package:citis/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../theme.dart';
import '../widgets/agenda_view.dart';
import '../widgets/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const bodies = [
  HomeView(),
  AgendaView(),
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

class _FilterScreen extends ConsumerWidget {
  const _FilterScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterNotifierProvider);
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
          for (final track in TechnicalTrack.values) ...[
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              controlAffinity: ListTileControlAffinity.leading,
              value: filters.contains(track),
              onChanged: (bool? value) =>
                  ref.read(filterNotifierProvider.notifier).toggleFilter(track),
              title: Text(
                track.inSpanish,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Gap(8),
          ],
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
