import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models.dart';
import '../theme.dart';

class AcademicSessionDetailPage extends StatelessWidget {
  const AcademicSessionDetailPage({
    super.key,
    required this.session,
    required this.hour,
    required this.location,
  });

  final AcademicSession session;
  final String hour;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          session.map(
            onWorkshop: (_) => "Workshop",
            onKeyNote: (_) => "Key Note",
            onPaperExhibition: (_) => "Paper Exhibition",
          ),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Gap(4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      session.maybeMap(
                        orElse: () => Icon(
                          Icons.person_outlined,
                          color: r2,
                        ),
                        onPaperExhibition: (_) => Icon(
                          Icons.people_outline_rounded,
                          color: r2,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          session.map(
                            onWorkshop: (workshop) =>
                                workshop.speaker.fullTitle,
                            onKeyNote: (keyNote) => keyNote.speaker.fullTitle,
                            onPaperExhibition: (paperExhibition) =>
                                paperExhibition.speakersFlat,
                          ),
                          style: GoogleFonts.cormorant(
                            fontSize: 18,
                            color: r2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  session.map(
                    onWorkshop: (workshop) => Text(
                      workshop.abstract,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onKeyNote: (keyNote) => Text(
                      keyNote.abstract,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onPaperExhibition: (_) => Offstage(),
                  ),
                  const Gap(8),
                  session.map(
                    onWorkshop: (workshop) => ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tertiary,
                        foregroundColor: Colors.white,
                      ),
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.edit_calendar_outlined),
                      label: const Text("Registrarse"),
                      onPressed: () => _launchUrl(workshop.registerLink),
                    ),
                    onKeyNote: (keyNote) => ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tertiary,
                        foregroundColor: Colors.white,
                      ),
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.edit_calendar_outlined),
                      label: const Text("Registrarse"),
                      onPressed: () => _launchUrl(keyNote.registerLink),
                    ),
                    onPaperExhibition: (_) => Offstage(),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tertiary,
                      foregroundColor: Colors.white,
                    ),
                    iconAlignment: IconAlignment.end,
                    icon: SvgPicture.asset(
                      "assets/svg/ic_add_calendar.svg",
                      color: Colors.white,
                    ),
                    label: const Text("Añadir a mi calendario"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 32,
                        ),
                        const Gap(4),
                        Expanded(
                          child: Text(
                            location,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        const Gap(4),
                        Text(
                          "Fri. 03-12-2024",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: bodyText),
                        ),
                        const Gap(16),
                        const Icon(Icons.access_time_outlined),
                        const Gap(4),
                        Text(
                          hour,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: bodyText),
                        ),
                      ],
                    ),
                    const Gap(8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: backgroundContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            session.technicalTrack.inSpanish.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: primary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
