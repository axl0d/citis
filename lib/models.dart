import 'package:flutter/material.dart';

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
    this.session,
    this.sessions,
  });

  final String hour;
  final String? track;
  final KeyNote? session;
  final List<AcademicSession>? sessions;
}

class ScheduleDay {
  const ScheduleDay({
    required this.day,
    required this.timeSlots,
    required this.weekday,
    required this.month,
  });

  final int day;
  final String weekday;
  final String month;
  final List<TimeSlot> timeSlots;

  String get weekdayMin => weekday.substring(0, 3);
}

class TimeSlot {
  const TimeSlot({required this.time, required this.locations});

  final String time;
  final List<Location> locations;
}

class Location {
  const Location({required this.name, required this.sessions});

  final String name;
  final List<Session> sessions;
}

class Session {
  const Session({required this.title});

  final String title;
}

class AcademicSession extends Session {
  const AcademicSession({
    required super.title,
    required this.technicalTrack,
  });

  final TechnicalTrack technicalTrack;

  T map<T>({
    required T Function(Workshop) onWorkshop,
    required T Function(KeyNote) onKeyNote,
    required T Function(PaperExhibition) onPaperExhibition,
  }) {
    switch (runtimeType) {
      case Workshop:
        return onWorkshop.call(this as Workshop);
      case KeyNote:
        return onKeyNote.call(this as KeyNote);
      case PaperExhibition:
        return onPaperExhibition.call(this as PaperExhibition);
      default:
        throw Exception("Unknown type");
    }
  }

  T maybeMap<T>({
    T Function(Workshop)? onWorkshop,
    T Function(KeyNote)? onKeyNote,
    T Function(PaperExhibition)? onPaperExhibition,
    required T Function() orElse,
  }) {
    if (this is Workshop && onWorkshop != null) {
      return onWorkshop.call(this as Workshop);
    }
    if (this is KeyNote && onKeyNote != null) {
      return onKeyNote.call(this as KeyNote);
    }
    if (this is PaperExhibition && onPaperExhibition != null) {
      return onPaperExhibition.call(this as PaperExhibition);
    }
    return orElse.call();
  }
}

class NoTechnicalSession extends Session {
  const NoTechnicalSession({required super.title});
}

class Workshop extends AcademicSession {
  const Workshop({
    required super.title,
    required super.technicalTrack,
    required this.speaker,
    required this.abstract,
    required this.registerLink,
  });

  final Speaker speaker;
  final String abstract;
  final String registerLink;
}

class KeyNote extends AcademicSession {
  const KeyNote({
    required super.title,
    required super.technicalTrack,
    required this.speaker,
    required this.abstract,
    required this.registerLink,
  });

  final Speaker speaker;
  final String abstract;
  final String registerLink;
}

class PaperExhibition extends AcademicSession {
  const PaperExhibition({
    required super.title,
    required super.technicalTrack,
    required this.speakers,
  });

  final List<Speaker> speakers;

  String get speakersFlat =>
      speakers.map((speaker) => speaker.fullTitle).join(", ");
}

class Speaker {
  const Speaker({
    required this.name,
    this.degree,
  });

  final String name;
  final String? degree;

  String get fullTitle => degree != null ? "$name, $degree" : name;
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
