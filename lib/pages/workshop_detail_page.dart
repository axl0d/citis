import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models.dart';
import '../theme.dart';

class WorkshopDetailPage extends StatelessWidget {
  const WorkshopDetailPage({
    super.key,
    required this.workshop,
  });

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          "Workshop",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workshop.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Gap(4),
            Row(
              children: [
                const Icon(
                  Icons.person_outlined,
                  color: r2,
                ),
                const SizedBox(width: 4),
                Text(
                  workshop.speakersFlat,
                  style: GoogleFonts.cormorant(
                    fontSize: 18,
                    color: r2,
                  ),
                ),
              ],
            ),
            const Gap(16),
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
            const Spacer(),
            Card(
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
                            workshop.location,
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
                          "14:00 - 14:25",
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
                            workshop.topic.inSpanish.toUpperCase(),
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
          ],
        ),
      ),
    );
  }
}
