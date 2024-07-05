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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _EventDayButtons(
              (selectedIndex) => setState(
                () => _selectedData = data.elementAt(selectedIndex),
              ),
            ),
          ),
        ),
        const SliverGap(8),
        SliverList.list(
          children: [
            for (final eventTrack in _selectedData) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(eventTrack.track!),
                    ),
                  ),
                ),
                const Gap(8),
              ],
              if (eventTrack.workshop != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _WorkshopCard(
                    key: Key("workshop ${eventTrack.workshop!.title}"),
                    workshop: eventTrack.workshop!,
                  ),
                ),
                const Gap(8),
              ],
              if (eventTrack.workshops != null)
                for (final workshop in eventTrack.workshops!) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _WorkshopCard(
                      key: Key("workshop ${workshop.title}"),
                      workshop: workshop,
                    ),
                  ),
                  const Gap(8),
                ]
            ]
          ],
        )
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
    return Wrap(
      children: [
        for (var i = 0; i < eventDays.length; i++)
          _EventDayButtonItem(
            index: i,
            selectedIndex: _selectedDay,
            eventDay: eventDays[i],
            onTap: (selectedDay) {
              setState(() => _selectedDay = selectedDay);
              widget.onSelect(i);
            },
          ),
      ],
    );
  }
}

class _EventDayButtonItem extends StatelessWidget {
  const _EventDayButtonItem({
    required this.index,
    required this.selectedIndex,
    required this.eventDay,
    required this.onTap,
  });

  final int index;
  final int selectedIndex;
  final EventDay eventDay;
  final Function(int selectedIndex) onTap;

  bool get _isSelected => index == selectedIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: _isSelected ? primary : Colors.white,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: () => onTap.call(index),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                eventDay.weekdayMin,
                style: textTheme.bodyMedium?.copyWith(
                  color: _isSelected ? primary : null,
                ),
              ),
              const Gap(8),
              Text(
                "${eventDay.day}",
                style: textTheme.headlineSmall?.copyWith(
                  color: _isSelected ? primary : null,
                ),
              ),
            ],
          ),
        ),
      ),
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
