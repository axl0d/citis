import 'package:flutter/material.dart';

import '../launch_url.dart';
import '../theme.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Información de contacto",
            style: textTheme.headlineMedium?.copyWith(color: primary),
          ),
          ListTile(
            leading: Icon(
              Icons.phone_outlined,
              color: primary,
            ),
            title: Text(
              "(+593) 4 2590-630 ext.: 4540",
              style: textTheme.bodyMedium,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: primary,
            ),
            title: Text(
              "citis@ups.edu.ec",
              style: textTheme.bodyMedium,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.place_outlined,
              color: primary,
            ),
            title: Text(
              "Km. 19 Vía La Costa",
              style: textTheme.bodyMedium?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () => openUrl("https://g.co/kgs/DELxvTT"),
          ),
        ],
      ),
    );
  }
}
