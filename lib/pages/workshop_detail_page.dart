import 'package:flutter/material.dart';

import '../workshop.dart';

class WorkshopDetailPage extends StatelessWidget {
  const WorkshopDetailPage({
    required this.workshop,
  });

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: workshop.topic.color,
        title: const Text("Workshop"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Título",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              workshop.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.person_outlined),
                const SizedBox(width: 4),
                Text(workshop.speaker.fullTitle),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "Categoría",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Chip(
              label: Text(workshop.topic.inSpanish),
              backgroundColor: workshop.topic.color,
            ),
            const SizedBox(height: 4),
            Text(workshop.location),
          ],
        ),
      ),
    );
  }
}
