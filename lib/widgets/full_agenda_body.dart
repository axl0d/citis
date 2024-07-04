import 'package:flutter/material.dart';

import '../pages/workshop_detail_page.dart';
import '../workshop.dart';

class FullAgendaBody extends StatelessWidget {
  const FullAgendaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SegmentedButton(
            style: SegmentedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            selectedIcon: const Offstage(),
            segments: const <ButtonSegment<int>>[
              ButtonSegment(
                value: 0,
                label: Column(
                  children: [
                    Text("Julio"),
                    Text("17"),
                  ],
                ),
              ),
              ButtonSegment(
                  value: 1,
                  label: Column(
                    children: [
                      Text("Julio"),
                      Text("18"),
                    ],
                  )),
              ButtonSegment(
                value: 2,
                label: Column(
                  children: [
                    Text("Julio"),
                    Text("19"),
                  ],
                ),
              ),
            ],
            selected: const <int>{0},
          ),
        ),
        for (final workshop in workshops) _WorkshopCard(workshop: workshop)
      ],
    );
  }
}

class _WorkshopCard extends StatelessWidget {
  const _WorkshopCard({
    required this.workshop,
  });

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Workshop',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(workshop.title),
            ],
          ),
          subtitle: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Ponente:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const WidgetSpan(child: SizedBox(width: 4)),
                TextSpan(text: workshop.speaker.fullTitle),
              ],
              style: const TextStyle(color: Colors.black),
            ),
          ),
          trailing: IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () => _navigateToDetail(context),
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
