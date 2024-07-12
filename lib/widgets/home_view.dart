import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models.dart';
import '../theme.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    // final workshops = jul17[1].sessions!;
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
          // for (final workshop in workshops) ...[
          //   Padding(
          //     padding: const EdgeInsets.all(16),
          //     child: NextSessionItem(workshop: workshop),
          //   ),
          //   const Divider(),
          // ]
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
        Text(workshop.speaker.fullTitle),
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
