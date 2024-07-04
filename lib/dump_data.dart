import 'models.dart';

const speaker1 =
    Speaker(name: 'María Alejandra De La Cruz Mora', degree: 'MSc');
const speaker2 = Speaker(name: 'Edwin Marcelo García Torres', degree: 'Ph.D');
const speaker3 =
    Speaker(name: 'Néstor Diego Rivera Campoverde', degree: 'Ph.D');
const speaker4 = Speaker(name: 'Franklin Ilich Kuonqui Gainza', degree: 'MSc');
const speaker5 = Speaker(name: 'Aura Liz Cevallos Almeida', degree: 'MSc');
const speaker6 =
    Speaker(name: 'Marcelo Xavier Estrella Guayasamin', degree: 'MSc');
const speaker7 = Speaker(name: 'Dario Fernando Huilcapi Subia', degree: 'MSc');
const speaker8 = Speaker(name: 'Héctor René Vega Carrillo', degree: 'Ph.D');

const workshops = [];

final jul17 = [
  const EventTrack(hour: "8:00", track: "Registration to the conference"),
  const EventTrack(
    hour: "09:00 - 13:00",
    workshops: [
      Workshop(
        speaker: speaker1,
        topic: TechnicalTrack.sustainability,
        location: 'room B1',
        title:
            'Fermentation process and industrial waste upcycling by industrial microorganisms',
      ),
      Workshop(
        speaker: speaker2,
        topic: TechnicalTrack.industry,
        location: 'Computer Lab. A7 -  2nd floor building A',
        title:
            'Exploring Industrial and Commercial Microgrids: Regulation and Opportunities for the Energy Future',
      ),
      Workshop(
        speaker: speaker3,
        topic: TechnicalTrack.mobility,
        location: 'Computer Lab. A4 -  2nd floor building A',
        title:
            'Estimation of pollutant emissions in real driving conditions using OBD, GPS data, and Machine Learning',
      ),
      Workshop(
        speaker: speaker4,
        topic: TechnicalTrack.infoTelecom,
        location: 'Computer Lab. A2 -  2nd floor building A',
        title: 'Creating data plots in Latex using the pgfplots package',
      ),
    ],
  ),
  const EventTrack(
    hour: "13:00",
    track: "Registration Bureau (hall next to the Aula Magna)",
  ),
  const EventTrack(
    hour: "13:00 - 14:00",
    track: "LUNCH - 6th floor",
  ),
  const EventTrack(
    hour: "14:00 - 18:00",
    workshops: [
      Workshop(
        speaker: speaker5,
        topic: TechnicalTrack.industry,
        location: 'Computer Lab. A7 -  2nd floor building A',
        title: 'TICs: The future of learning',
      ),
      Workshop(
        speaker: speaker6,
        topic: TechnicalTrack.mobility,
        location: 'Computer Lab. A4 -  2nd floor building A',
        title:
            'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
      ),
      Workshop(
        speaker: speaker7,
        topic: TechnicalTrack.infoTelecom,
        location: 'Computer Lab. A2 -  2nd floor building A',
        title:
            'Principles of information security and risk management to mitigate threats that commonly affect businesses',
      ),
    ],
  ),
];

final jul18 = [
  const EventTrack(hour: "8:00", track: "Registration to the conference"),
  const EventTrack(
    hour: "09:00 - 17:00",
    track: "Feria de innovación tecnológica - Detras del aula magna",
  ),
  const EventTrack(
    hour: "09:30 - 10:30",
    track: "Inaugural ceremony - AULA MAGNA",
  ),
  const EventTrack(
    hour: "10:30 - 11:30",
    workshop: Workshop(
      speaker: speaker8,
      topic: TechnicalTrack.industry,
      location: "AULA MAGNA",
      title: "Energy, Environment, and Society",
    ),
  ),
  const EventTrack(
    hour: "12:00 - 13:00",
    workshops: [
      Workshop(
        speaker: speaker5,
        topic: TechnicalTrack.industry,
        location: 'Computer Lab. A7 -  2nd floor building A',
        title: 'TICs: The future of learning',
      ),
      Workshop(
        speaker: speaker6,
        topic: TechnicalTrack.mobility,
        location: 'Computer Lab. A4 -  2nd floor building A',
        title:
            'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
      ),
      Workshop(
        speaker: speaker7,
        topic: TechnicalTrack.infoTelecom,
        location: 'Computer Lab. A2 -  2nd floor building A',
        title:
            'Principles of information security and risk management to mitigate threats that commonly affect businesses',
      ),
    ],
  ),
  const EventTrack(
    hour: "13:00",
    track: "Registration Bureau (hall next to the Aula Magna)",
  ),
  const EventTrack(
    hour: "13:00 - 14:00",
    track: "LUNCH - 6th floor",
  ),
  const EventTrack(
    hour: "14:00 - 18:00",
    workshops: [
      Workshop(
        speaker: speaker5,
        topic: TechnicalTrack.industry,
        location: 'Computer Lab. A7 -  2nd floor building A',
        title: 'TICs: The future of learning',
      ),
      Workshop(
        speaker: speaker6,
        topic: TechnicalTrack.mobility,
        location: 'Computer Lab. A4 -  2nd floor building A',
        title:
            'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
      ),
      Workshop(
        speaker: speaker7,
        topic: TechnicalTrack.infoTelecom,
        location: 'Computer Lab. A2 -  2nd floor building A',
        title:
            'Principles of information security and risk management to mitigate threats that commonly affect businesses',
      ),
    ],
  ),
];
