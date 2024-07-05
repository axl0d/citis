import 'package:flutter/material.dart';

const primary = Color(0xFFC9224B);
const secondary = Color(0xFF4E4E4E);
const tertiary = Color(0xFF131313);
const background = Color(0xFFF2F2F2);
const backgroundContainer = Color(0xFFFFD9E2);
const r2 = Color(0xFF9C1129);
const r3 = Color(0xFFFA1742);
const grey = Color(0xFFDCDCDC);
const bodyText = Color(0xFF162113);

enum TechnicalTrack {
  sustainability,
  industry,
  mobility,
  infoTelecom,
}

enum Agenda {
  full,
  user,
}

class EventTrack {
  const EventTrack({
    required this.hour,
    this.track,
    this.workshop,
    this.workshops,
  });

  final String hour;
  final String? track;
  final Workshop? workshop;
  final List<Workshop>? workshops;
}

class Workshop {
  const Workshop({
    required this.speaker,
    required this.topic,
    required this.location,
    required this.title,
  });

  final Speaker speaker;
  final TechnicalTrack topic;
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

extension TopicExtension on TechnicalTrack {
  String get inSpanish {
    switch (this) {
      case TechnicalTrack.sustainability:
        return 'Sostenibilidad';
      case TechnicalTrack.industry:
        return 'Industria';
      case TechnicalTrack.mobility:
        return 'Movilidad';
      case TechnicalTrack.infoTelecom:
        return 'Info Telecomunicaciones';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case TechnicalTrack.sustainability:
        return Colors.green.shade300;
      case TechnicalTrack.industry:
        return Colors.blue.shade300;
      case TechnicalTrack.mobility:
        return Colors.orange.shade300;
      case TechnicalTrack.infoTelecom:
        return Colors.purple.shade200;
      default:
        return Colors.grey;
    }
  }
}
