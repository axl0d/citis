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
  ScheduleDay _selectedData = days[3];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  child: _TimeSlot(timeSlot: timeSlot),
                ),
                const Gap(8),
                ...timeSlot.locations
                    .expand(
                      (location) => location.sessions.map(
                        (session) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: session.map(
                            onNoTechnicalSession: (noTechnicalSession) =>
                                _NoTechnicalSession(
                              session: noTechnicalSession,
                            ),
                            onAcademicSession: (academicSession) =>
                                _AcademicSessionClickableCard(
                              session: academicSession,
                              location: location.name,
                              hour: timeSlot.time,
                              date: _selectedData.detailedDate,
                            ),
                          ),
                        ),
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

class _NoTechnicalSession extends StatelessWidget {
  const _NoTechnicalSession({required this.session});

  final NoTechnicalSession session;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          session.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _TimeSlot extends StatelessWidget {
  const _TimeSlot({required this.timeSlot});

  final TimeSlot timeSlot;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Text(
          timeSlot.time,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
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
  int _selectedDay = 3;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i = 0; i < days.length; i++)
          _EventDayButtonItem(
            index: i,
            selectedIndex: _selectedDay,
            eventDay: days[i],
            isDisabled: days[i].timeSlots.isEmpty,
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
    required this.isDisabled,
    required this.eventDay,
    required this.onTap,
  });

  final int index;
  final int selectedIndex;
  final bool isDisabled;
  final ScheduleDay eventDay;
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
        onTap: isDisabled ? null : () => onTap.call(index),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                eventDay.weekdayMin,
                textScaleFactor: 1.0,
                style: textTheme.bodySmall?.copyWith(
                  color: _isSelected
                      ? primary
                      : isDisabled
                          ? grey
                          : null,
                ),
              ),
              const Gap(8),
              Text(
                "${eventDay.day}",
                style: textTheme.headlineSmall?.copyWith(
                  color: _isSelected
                      ? primary
                      : isDisabled
                          ? grey
                          : null,
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
    required this.hour,
    required this.location,
    required this.date,
  });

  final AcademicSession session;
  final String hour;
  final String location;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: InkWell(
        child: ListTile(
          title: Text(
            session.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: session.map(
            onWorkshop: (workshop) =>
                _AuthorSubtitle(speaker: workshop.speaker),
            onKeyNote: (keyNote) => _AuthorSubtitle(speaker: keyNote.speaker),
            onPaperExhibition: (paperExhibition) => _AuthorsSubtitle(
              speakers: paperExhibition.speakersFlat,
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
      MaterialPageRoute(
        builder: (_) => AcademicSessionDetailPage(
          session: session,
          hour: hour,
          date: date,
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
            style: Theme.of(context).textTheme.headlineLarge,
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
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }
}
