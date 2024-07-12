import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../dumb_data.dart';
import '../models.dart';
import '../pages/academia_session_detail_page.dart';
import '../theme.dart';

class FullAgendaBody extends StatefulWidget {
  const FullAgendaBody({super.key});

  @override
  State<FullAgendaBody> createState() => _FullAgendaBodyState();
}

class _FullAgendaBodyState extends State<FullAgendaBody> {
  ScheduleDay _selectedData = days[0];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _EventDayButtons(
              (selectedIndex) => setState(
                () => _selectedData = days.elementAt(selectedIndex),
              ),
            ),
          ),
        ),
        const SliverGap(8),
        SliverList.separated(
          itemCount: _selectedData.timeSlots.length,
          separatorBuilder: (_, __) => const Gap(8),
          itemBuilder: (_, index) {
            final timeSlot = _selectedData.timeSlots[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Text(timeSlot.time),
                    ),
                  ),
                ),
                const Gap(8),
                ...timeSlot.locations
                    .expand(
                      (location) => location.sessions.map(
                        (session) {
                          if (session is NoTechnicalSession)
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Card(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(session.title),
                                ),
                              ),
                            );
                          if (session is Workshop)
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: _AcademicSessionClickableCard(
                                session: session,
                                subtitle: _AuthorSubtitle(
                                  speaker: session.speaker,
                                ),
                                location: location.name,
                                hour: timeSlot.time,
                              ),
                            );
                          if (session is KeyNote)
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: _AcademicSessionClickableCard(
                                session: session,
                                subtitle: _AuthorSubtitle(
                                  speaker: session.speaker,
                                ),
                                location: location.name,
                                hour: timeSlot.time,
                              ),
                            );
                          if (session is PaperExhibition)
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: _AcademicSessionClickableCard(
                                session: session,
                                subtitle: _AuthorsSubtitle(
                                  speakers: session.speakersFlat,
                                ),
                                location: location.name,
                                hour: timeSlot.time,
                              ),
                            );
                          return Offstage();
                        },
                      ),
                    )
                    .toList()
              ],
            );
          },
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

class _AcademicSessionClickableCard extends StatelessWidget {
  const _AcademicSessionClickableCard({
    required this.session,
    required this.subtitle,
    required this.hour,
    required this.location,
  });

  final AcademicSession session;
  final Widget subtitle;
  final String hour;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: InkWell(
        child: ListTile(
          title: Text(session.title),
          subtitle: subtitle,
        ),
        onTap: () => _navigateToDetail(context),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AcademicSessionDetailPage(
          session: session,
          hour: hour,
          location: location,
        ),
      ),
    );
  }
}

class _AuthorSubtitle extends StatelessWidget {
  const _AuthorSubtitle({required this.speaker});

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.person_outlined),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            speaker.fullTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

class _AuthorsSubtitle extends StatelessWidget {
  const _AuthorsSubtitle({required this.speakers});

  final String speakers;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.people_outline_rounded),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            speakers,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
