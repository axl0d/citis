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
}

enum Topic {
  sustainability,
  industry,
  mobility,
  infoTelecom,
}

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

const workshops = [
  Workshop(
    speaker: speaker1,
    topic: Topic.sustainability,
    location: 'room B1',
    title:
        'Fermentation process and industrial waste upcycling by industrial microorganisms',
  ),
  Workshop(
    speaker: speaker2,
    topic: Topic.industry,
    location: 'Computer Lab. A7 -  2nd floor building A',
    title:
        'Exploring Industrial and Commercial Microgrids: Regulation and Opportunities for the Energy Future',
  ),
  Workshop(
    speaker: speaker3,
    topic: Topic.mobility,
    location: 'Computer Lab. A4 -  2nd floor building A',
    title:
        'Estimation of pollutant emissions in real driving conditions using OBD, GPS data, and Machine Learning',
  ),
  Workshop(
    speaker: speaker4,
    topic: Topic.infoTelecom,
    location: 'Computer Lab. A2 -  2nd floor building A',
    title: 'Creating data plots in Latex using the pgfplots package',
  ),
  Workshop(
    speaker: speaker5,
    topic: Topic.industry,
    location: 'Computer Lab. A7 -  2nd floor building A',
    title: 'TICs: The future of learning',
  ),
  Workshop(
    speaker: speaker6,
    topic: Topic.mobility,
    location: 'Computer Lab. A4 -  2nd floor building A',
    title:
        'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
  ),
  Workshop(
    speaker: speaker7,
    topic: Topic.infoTelecom,
    location: 'Computer Lab. A2 -  2nd floor building A',
    title:
        'Principles of information security and risk management to mitigate threats that commonly affect businesses',
  ),
];
