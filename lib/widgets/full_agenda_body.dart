import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../dumb_data.dart';
import '../models.dart';
import '../pages/workshop_detail_page.dart';

const data = [jul17, jul18, jul17];

class FullAgendaBody extends StatefulWidget {
  const FullAgendaBody({super.key});

  @override
  State<FullAgendaBody> createState() => _FullAgendaBodyState();
}

class _FullAgendaBodyState extends State<FullAgendaBody> {
  List<EventTrack> _selectedData = data[0];

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: _EventDayButtons(
            (selectedIndex) => setState(
              () => _selectedData = data.elementAt(selectedIndex),
            ),
          ),
        ),
        const Gap(8),
        for (final eventTrack in _selectedData) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Text(eventTrack.hour),
              ),
            ),
          ),
          const Gap(8),
          if (eventTrack.track != null) ...[
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(eventTrack.track!),
              ),
            ),
            const Gap(8),
          ],
          if (eventTrack.workshop != null) ...[
            _WorkshopCard(
              key: Key("workshop ${eventTrack.workshop!.title}"),
              workshop: eventTrack.workshop!,
            ),
            const Gap(8),
          ],
          if (eventTrack.workshops != null)
            for (final workshop in eventTrack.workshops!) ...[
              _WorkshopCard(
                key: Key("workshop ${workshop.title}"),
                workshop: workshop,
              ),
              const Gap(8),
            ]
        ]
      ],
    );
  }
}

class _EventDayButtons extends StatefulWidget {
  const _EventDayButtons(this.onSelect);

  final Function(int selectedIndex) onSelect;

  @override
  State<_EventDayButtons> createState() => _EventDayButtonsState();
}

class _EventDayButtonsState extends State<_EventDayButtons> {
  int _selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      style: SegmentedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      selectedIcon: const Offstage(),
      segments: const <ButtonSegment<int>>[
        ButtonSegment(
          value: 0,
          label: _EventDayButtonItem(day: 17),
        ),
        ButtonSegment(
          value: 1,
          label: _EventDayButtonItem(day: 18),
        ),
        ButtonSegment(
          value: 2,
          label: _EventDayButtonItem(day: 19),
        ),
      ],
      selected: <int>{_selectedDay},
      onSelectionChanged: (Set<int> newSelection) {
        setState(() {
          _selectedDay = newSelection.first;
          widget.onSelect.call(_selectedDay);
        });
      },
    );
  }
}

class _EventDayButtonItem extends StatelessWidget {
  const _EventDayButtonItem({required this.day});

  final int day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Julio"),
        Text(
          "$day",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class _WorkshopCard extends StatelessWidget {
  const _WorkshopCard({
    required super.key,
    required this.workshop,
  });

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: InkWell(
        child: Dismissible(
          key: key!,
          child: ListTile(
            title: Text(workshop.title),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.person_outlined),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    workshop.speaker.fullTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () => _navigateToDetail(context),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => WorkshopDetailPage(workshop: workshop)),
    );
  }
}
