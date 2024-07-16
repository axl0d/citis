import 'package:citis/dumb_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../launch_url.dart';
import '../models.dart';
import '../theme.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    final nextSessions = wednesday.timeSlots[1];
    final textTheme = Theme.of(context).textTheme;
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
              "Registrarse",
              style: textTheme.headlineMedium,
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            leading: Icon(
              Icons.public_outlined,
              color: primary,
            ),
            title: Text(
              "Ir al sitio",
              style: textTheme.bodyMedium?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () => openUrl(
                "https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1082"),
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              "Next Session",
              style: textTheme.headlineMedium,
            ),
          ),
          const Divider(color: Colors.grey),
          ...nextSessions.locations.expand(
            (location) => location.sessions.map(
              (session) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: _NextSessionItem(
                      session: session as AcademicSession,
                      location: location.name,
                      date: wednesday.dateMin,
                      time: nextSessions.time,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NextSessionItem extends StatelessWidget {
  const _NextSessionItem({
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
