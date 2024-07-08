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
const speaker9 = Speaker(name: 'Guillermo O. Pizarro-Vasquez');
const speaker10 = Speaker(name: 'Juan P. Ortiz');
const speaker11 = Speaker(name: 'Juan D. Valladolid');
const speaker12 = Speaker(name: 'M.Soledad Gutierrez');
const speaker13 = Speaker(name: 'Javier Bone');
const speaker14 = Speaker(name: 'Carlos Ulloa');
const speaker15 = Speaker(name: 'Karina Pazmiño');
const speaker16 = Speaker(name: 'Antonio Pérez-Torres');
const speaker17 = Speaker(name: 'Rene-Vinicio Sánchez');
const speaker18 = Speaker(name: 'Susana Barceló-Cerdá');
const speaker19 = Speaker(name: 'Génesis Gabriela Macansela Tapia');
const speaker20 = Speaker(name: 'Jean Carlos Márquez Ordóñez');
const speaker21 = Speaker(name: 'Esteban Fernando Ordóñez Morales');
const speaker22 = Speaker(name: 'Juan Paúl Inga Ortega');
const speaker23 = Speaker(name: 'Marcelo Estrella-Guayasamin');
const speaker24 = Speaker(name: 'Victor Vivar Quiroz');
const speaker25 = Speaker(name: 'Aaron Delgado Quinto');
const speaker26 = Speaker(name: 'Fernando Gomez Berrezueta');
const speaker27 = Speaker(name: 'Gabriela Dau-Jarama');
const speaker28 = Speaker(name: 'Segundo F. Vilema-Escudero');
const speaker29 = Speaker(name: 'Jaime M. Samaniego-López');
const speaker30 = Speaker(name: 'Marlon Manya-Orellana');
const speaker31 = Speaker(name: 'Hernan Lara-Padilla');
const speaker32 = Speaker(name: 'Javier Sánchez');
const speaker33 = Speaker(name: 'Tania Rojas');
const speaker34 = Speaker(name: 'Tatiana Dolores Cárdenas-Guaraca');
const speaker35 = Speaker(name: 'Danilo Andrés Molina-Vidal');
const speaker36 = Speaker(name: 'Vladimir Robles-Bykbaev');
const speaker37 = Speaker(name: 'Jairo Jaime-Carvajal');
const speaker38 = Speaker(name: 'Jaime Naranjo-Moran');
const speaker39 = Speaker(name: 'Angela Pacheco Flores De Valgaz');
const speaker40 = Speaker(name: 'Jose Luis Ballesteros-Lara');
const speaker41 = Speaker(name: 'Hernan Lara-Padilla');
const speaker42 = Speaker(name: 'Génesis Dayana Guevara Huacón');
const speaker43 = Speaker(name: 'Melissa Arlette Zambrano Peñafiel');
const speaker44 = Speaker(name: 'Tania Rojas');
const speaker45 = Speaker(name: 'Kevin Arias-Ceciliano');
const speaker46 = Speaker(name: 'Dagoberto Arias-Aguilar');
const speaker47 = Speaker(name: 'Rooel Campos-Rodríguez');
const speaker48 = Speaker(name: 'Jesús Mora-Molina');
const speaker49 = Speaker(name: 'Daysi Alexandra Baño-Morales');
const speaker50 = Speaker(name: 'Juan Pedro Fernández-Blázquez');
const speaker51 = Speaker(name: 'Andrea Fernández-Gorgojo');
const speaker52 = Speaker(name: 'Antonio Vizán-Idiope');

const eventDays = [
  EventDay(day: 17, weekday: "Miércoles", month: "Julio"),
  EventDay(day: 18, weekday: "Jueves", month: "Julio"),
  EventDay(day: 19, weekday: "Viernes", month: "Julio"),
];

const jul17 = [
  EventTrack(hour: "8:00", track: "Registration to the conference"),
  EventTrack(
    hour: "09:00 - 13:00",
    workshops: [
      Workshop(
        speakers: [speaker1],
        topic: TechnicalTrack.sustainability,
        location: 'room B1',
        title:
            'Fermentation process and industrial waste upcycling by industrial microorganisms',
      ),
      Workshop(
        speakers: [speaker2],
        topic: TechnicalTrack.industry,
        location: 'Computer Lab. A7 -  2nd floor building A',
        title:
            'Exploring Industrial and Commercial Microgrids: Regulation and Opportunities for the Energy Future',
      ),
      Workshop(
        speakers: [speaker3],
        topic: TechnicalTrack.mobility,
        location: 'Computer Lab. A4 -  2nd floor building A',
        title:
            'Estimation of pollutant emissions in real driving conditions using OBD, GPS data, and Machine Learning',
      ),
      Workshop(
        speakers: [speaker4],
        topic: TechnicalTrack.infoTelecom,
        location: 'Computer Lab. A2 -  2nd floor building A',
        title: 'Creating data plots in Latex using the pgfplots package',
      ),
    ],
  ),
  EventTrack(
    hour: "13:00",
    track: "Registration Bureau (hall next to the Aula Magna)",
  ),
  EventTrack(
    hour: "13:00 - 14:00",
    track: "LUNCH - 6th floor",
  ),
  EventTrack(
    hour: "14:00 - 18:00",
    workshops: [
      Workshop(
        speakers: [speaker5],
        topic: TechnicalTrack.industry,
        location: 'Computer Lab. A7 -  2nd floor building A',
        title: 'TICs: The future of learning',
      ),
      Workshop(
        speakers: [speaker6],
        topic: TechnicalTrack.mobility,
        location: 'Computer Lab. A4 -  2nd floor building A',
        title:
            'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
      ),
      Workshop(
        speakers: [speaker7],
        topic: TechnicalTrack.infoTelecom,
        location: 'Computer Lab. A2 -  2nd floor building A',
        title:
            'Principles of information security and risk management to mitigate threats that commonly affect businesses',
      ),
    ],
  ),
];

const jul18 = [
  EventTrack(hour: "8:00", track: "Registration to the conference"),
  EventTrack(
    hour: "09:00 - 17:00",
    track: "Feria de innovación tecnológica - Detras del aula magna",
  ),
  EventTrack(
    hour: "09:30 - 10:30",
    track: "Inaugural ceremony - AULA MAGNA",
  ),
  EventTrack(
    hour: "10:30 - 11:30",
    workshop: Workshop(
      speakers: [speaker8],
      topic: TechnicalTrack.industry,
      location: "AULA MAGNA",
      title: "Energy, Environment, and Society",
    ),
  ),
  EventTrack(
    hour: "12:00 - 13:00",
    workshops: [
      Workshop(
        speakers: [speaker5],
        topic: TechnicalTrack.industry,
        location: 'Computer Lab. A7 -  2nd floor building A',
        title: 'TICs: The future of learning',
      ),
      Workshop(
        speakers: [speaker6],
        topic: TechnicalTrack.mobility,
        location: 'Computer Lab. A4 -  2nd floor building A',
        title:
            'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
      ),
      Workshop(
        speakers: [speaker7],
        topic: TechnicalTrack.infoTelecom,
        location: 'Computer Lab. A2 -  2nd floor building A',
        title:
            'Principles of information security and risk management to mitigate threats that commonly affect businesses',
      ),
    ],
  ),
  EventTrack(
    hour: "13:00",
    track: "Registration Bureau (hall next to the Aula Magna)",
  ),
  EventTrack(
    hour: "13:00 - 14:00",
    track: "LUNCH - 6th floor",
  ),
  EventTrack(
    hour: "14:00 - 18:00",
    workshops: [
      Workshop(
        speakers: [speaker5],
        topic: TechnicalTrack.industry,
        location: 'Computer Lab. A7 -  2nd floor building A',
        title: 'TICs: The future of learning',
      ),
      Workshop(
        speakers: [speaker6],
        topic: TechnicalTrack.mobility,
        location: 'Computer Lab. A4 -  2nd floor building A',
        title:
            'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
      ),
      Workshop(
        speakers: [speaker7],
        topic: TechnicalTrack.infoTelecom,
        location: 'Computer Lab. A2 -  2nd floor building A',
        title:
            'Principles of information security and risk management to mitigate threats that commonly affect businesses',
      ),
    ],
  ),
];

const jul19 = [
  EventTrack(
    hour: "09:00 - 09:25",
    workshops: [
      Workshop(
        speakers: [speaker9],
        topic: TechnicalTrack.infoTelecom,
        location: 'Multipurpose room 2nd floor building A',
        title:
            'Optimization of a rectangular warehouse design using heuristics techniques',
      ),
      Workshop(
        speakers: [speaker10, speaker11, speaker12],
        topic: TechnicalTrack.mobility,
        location: 'Multipurpose room 2nd floor building A',
        title:
            'Performance Analysis of the LiDAR-based 3D LIO-SAM Algorithm in Urban Areas: Case Study Cuenca City in the Ecuadorian Andes',
      ),
      Workshop(
        speakers: [speaker13, speaker14, speaker15],
        topic: TechnicalTrack.sustainability,
        location: 'Auditorium 3rd floor building A',
        title:
            'Analysis of UV Radiation Monitoring: Distribution of Stations in South American Countries during the Summer Season',
      ),
      Workshop(
        speakers: [speaker16, speaker17, speaker18],
        topic: TechnicalTrack.industry,
        location: 'Auditorium 3rd floor building A',
        title:
            'Classification of the severity level of breakage failure in spur gearboxes through frequency domain vibration signal analysis.',
      ),
    ],
  ),
  EventTrack(
    hour: "09:30 - 09:55",
    workshops: [
      Workshop(
        speakers: [speaker19, speaker20, speaker21, speaker22],
        topic: TechnicalTrack.infoTelecom,
        location: 'Multipurpose room 2nd floor building A',
        title:
            'An approach to bibliometric analysis of biosignal acquisition systems to determi-ne neurological and physiological aspects of driving stress',
      ),
      Workshop(
        speakers: [speaker23, speaker24, speaker25, speaker26],
        topic: TechnicalTrack.mobility,
        location: 'Multipurpose room 2nd floor building A',
        title:
            'Effect of Oxyhydrogen gas (HHO) addition on fuel consumption of M2 category vehicle by road tests.',
      ),
      Workshop(
        speakers: [speaker27, speaker28, speaker29, speaker30],
        topic: TechnicalTrack.sustainability,
        location: 'Auditorium 3rd floor building A',
        title:
            'Impact of foreign direct investment on energy intensity: Evidence from Latin American countries',
      ),
      Workshop(
        speakers: [speaker31, speaker32, speaker33],
        topic: TechnicalTrack.industry,
        location: 'Auditorium 3rd floor building A',
        title:
            'Optimizing the Weighing Process in Frozen Shrimp Production for Export',
      ),
    ],
  ),
  EventTrack(
    hour: "10:00 - 10:25",
    workshops: [
      Workshop(
        speakers: [speaker34, speaker35, speaker36],
        topic: TechnicalTrack.infoTelecom,
        location: 'Multipurpose room 2nd floor building A',
        title:
            'JointCare: An Integrated Platform for EMG Signal Analysis in Knee Osteoarthritis Rehabilitation',
      ),
      Workshop(
        speakers: [speaker37, speaker38, speaker39, speaker40],
        topic: TechnicalTrack.sustainability,
        location: 'Auditorium 3rd floor building A',
        title:
            'Phytochemical stimulation through the use of artisanal biols in banana seedlings Musa paradisiaca L.: A bibliometric and experimental review',
      ),
      Workshop(
        speakers: [speaker41, speaker42, speaker43, speaker44],
        topic: TechnicalTrack.industry,
        location: 'Auditorium 3rd floor building A',
        title:
            'A Six Sigma Approach to Enhancing the Production Performance of Pacific White Shrimp (Litopenaeus vannamei): A Proposal for Optimizing Stocking Density and Acclimation Methods',
      ),
    ],
  ),
  EventTrack(
    hour: "10:30 - 10:55",
    workshops: [
      Workshop(
        speakers: [speaker45, speaker46, speaker47, speaker48],
        topic: TechnicalTrack.sustainability,
        location: 'Auditorium 3rd floor building A',
        title:
            'Circular economy applicable to waste from the sus-tainable production of Musa textilis in Costa Rica',
      ),
      Workshop(
        speakers: [speaker49, speaker50, speaker51, speaker52],
        topic: TechnicalTrack.industry,
        location: 'Auditorium 3rd floor building A',
        title:
            'Influence of Injection Molding Parameters on the Orientation of Polypropylene Lamellar Structures Using Wide-Angle X-ray Scattering (WAXS) Technique',
      ),
    ],
  ),
];
