import 'package:flutter/material.dart';

enum Topic {
  sustainability,
  industry,
  mobility,
  infoTelecom,
}

enum Agenda {
  full,
  user,
}

class Workshop {
  const Workshop({
    required this.speaker,
    required this.topic,
    required this.location,
    required this.title,
  });

  final Speaker speaker;
  final Topic topic;
  final String location;
  final String title;
}

class Speaker {
  const Speaker({
    required this.name,
    required this.degree,
  });

  final String name;
  final String degree;

  String get fullTitle => "$name, $degree";
}

extension TopicExtension on Topic {
  String get inSpanish {
    switch (this) {
      case Topic.sustainability:
        return 'Sostenibilidad';
      case Topic.industry:
        return 'Industria';
      case Topic.mobility:
        return 'Movilidad';
      case Topic.infoTelecom:
        return 'Info Telecomunicaciones';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case Topic.sustainability:
        return Colors.green.shade300;
      case Topic.industry:
        return Colors.blue.shade300;
      case Topic.mobility:
        return Colors.orange.shade300;
      case Topic.infoTelecom:
        return Colors.purple.shade200;
      default:
        return Colors.grey;
    }
  }
}
