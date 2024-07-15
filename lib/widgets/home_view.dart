import 'package:citis/dumb_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models.dart';
import '../theme.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    final nextSessions = wednesday.timeSlots[1];
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
          ...nextSessions.locations.expand(
            (location) => location.sessions.map(
              (session) => Padding(
                padding: const EdgeInsets.all(16),
                child: NextSessionItem(
                  session: session as AcademicSession,
                  location: location.name,
                  date: wednesday.dateMin,
                  time: nextSessions.time,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextSessionItem extends StatelessWidget {
  const NextSessionItem({
    super.key,
    required this.session,
    required this.date,
    required this.time,
    required this.location,
  });

  final AcademicSession session;
  final String date;
  final String time;
  final String location;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          session.title,
          style: textTheme.bodyMedium,
        ),
        const Gap(8),
        Text(
          session.map(
            onWorkshop: (workshop) => workshop.speaker.fullTitle,
            onKeyNote: (keyNote) => keyNote.speaker.fullTitle,
            onPaperExhibition: (paperExhibition) =>
                paperExhibition.speakersFlat,
          ),
          style: textTheme.headlineLarge,
        ),
        const Gap(8),
        Row(
          children: [
            Expanded(
              child: Text("$date, $time"),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(color: primary),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
