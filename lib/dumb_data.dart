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

const days = [
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
];

const sunday = ScheduleDay(
  day: 14,
  timeSlots: [],
  weekday: "Domingo",
  month: "Julio",
);

const monday = ScheduleDay(
  day: 15,
  timeSlots: [],
  weekday: "Lunes",
  month: "Julio",
);

const tuesday = ScheduleDay(
  day: 16,
  timeSlots: [],
  weekday: "Martes",
  month: "Julio",
);

const wednesday = ScheduleDay(
  day: 17,
  month: "Julio",
  weekday: "Míercoles",
  timeSlots: [
    TimeSlot(
      time: "8:00",
      locations: [
        Location(
          name: "Aula Magna",
          sessions: [
            NoTechnicalSession(title: "Registration to the conference")
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "09:00 - 13:00",
      locations: [
        Location(
          name: "room B1",
          sessions: [
            Workshop(
              speaker: speaker1,
              technicalTrack: TechnicalTrack.sustainability,
              registerLink:
                  "https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1160",
              title:
                  'Fermentation process and industrial waste upcycling by industrial microorganisms',
              abstract:
                  'Industrial microorganisms’ valorization are of great importance to diverse sectors, because they play a fundamental role in the production of a wide range of products and processes. Their strategic use allows for economic, environmental, and social benefits. In this workshop, we will highlight the most relevant aspects of bioprocesses through practical activities such as the production of craft beer from malted barley by fermentation, and the production of a sustainable textile biomaterial using industrial waste. The purpose of this master class is to present techniques and analytical methods for the isolation and manipulation of microorganisms that generate a value-added product from industrial waste. In addition, image analysis and microscopy techniques will be shown for the colony quantification and morphology in fungi and microalgae.',
            ),
          ],
        ),
        Location(
          name: "Computer Lab. A7 -  2nd floor building A",
          sessions: [
            Workshop(
              speaker: speaker2,
              technicalTrack: TechnicalTrack.industry,
              abstract:
                  'This workshop will focus on the analysis of industrial and commercial microgrids under regulation 08/23, using the HOMER Energy software. Participants will explore how this regulation influences the design, implementation, and management of microgrids, with an emphasis on optimizing energy resources. Through practical case studies and simulation exercises with the HOMER Energy software, attendees will gain a deep understanding of how to select the optimal combination of energy sources, storage, and load management to meet the energy needs of various industrial and commercial applications. By the end of the workshop, participants will be equipped with practical skills and technical knowledge to effectively address challenges and seize opportunities in the design and management of microgrids in compliance with regulation 08/23.',
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1162',
              title:
                  'Exploring Industrial and Commercial Microgrids: Regulation and Opportunities for the Energy Future',
            )
          ],
        ),
        Location(
          name: "Computer Lab. A4 -  2nd floor building A",
          sessions: [
            Workshop(
              speaker: speaker3,
              technicalTrack: TechnicalTrack.mobility,
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1163',
              abstract:
                  'Internal combustion engines in automobiles are the largest source of pollution in urban areas, which is why these pollutants must be recorded. Thus, vehicle emission inventories are an extremely important tool for the implementation and subsequent evaluation of policies aimed at reducing environmental impact. The quality of the emission inventory results depends directly on the inputs and methodologies applied in their development. This workshop proposes a methodology for estimating emissions in real driving conditions, using OBD, GPS, and machine learning data, without the need for extensive measurement campaigns. This will be achieved by developing a prediction model based on virtual sensors and EURO 7 standards.',
              title:
                  'Estimation of pollutant emissions in real driving conditions using OBD, GPS data, and Machine Learning',
            )
          ],
        ),
        Location(
          name: "Computer Lab. A2 -  2nd floor building A",
          sessions: [
            Workshop(
              speaker: speaker4,
              technicalTrack: TechnicalTrack.infoTelecom,
              abstract:
                  'This workshop goal is to promote the interaction between the participants and the PGFPLOTS package of LATEX for to elaborate high resolution data graphics. For this reason, participants will be able to experiment with data exportation from Matlab/Simulink and MS Excel to create Latex plots. Then, they will be able to customize these graphs properties such as title, line and axis characteristics.',
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1164',
              title: 'Creating data plots in Latex using the pgfplots package',
            )
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "13:00",
      locations: [
        Location(
          name: "Aula Magna",
          sessions: [
            NoTechnicalSession(
                title: "Registration Bureau (hall next to the Aula Magna)")
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "13:00 - 14:00",
      locations: [
        Location(
          name: "6th floor",
          sessions: [
            NoTechnicalSession(
              title: "LUNCH - 6th floor",
            ),
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "14:00 - 18:00",
      locations: [
        Location(
          name: "Computer Lab. A7 -  2nd floor building A",
          sessions: [
            Workshop(
              speaker: speaker5,
              technicalTrack: TechnicalTrack.industry,
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1159',
              title: 'TICs: The future of learning',
              abstract:
                  'In the upcoming workshop, an overview of emerging trends in educational technology will be provided, enabling participants to facilitate the acquisition of practical skills and knowledge that can be directly applied in educational settings to enhance the learning experience. The workshop will offer platforms for networking, promoting collaboration and the exchange of innovative ideas. It will include case studies and concrete examples, helping to better understand how to implement these new technologies for both teachers and students. It is important to this workshop to have at least a B1 level of English proficiency.',
            ),
          ],
        ),
        Location(
          name: 'Computer Lab. A4 -  2nd floor building A',
          sessions: [
            Workshop(
              speaker: speaker6,
              technicalTrack: TechnicalTrack.mobility,
              abstract:
                  'The growing concern about the environmental impact of fossil fuels has driven the search for cleaner and more efficient energy alternatives. HHO gas (a mixture of hydrogen and oxygen) emerges as a promising solution, capable of improving combustion in traditional engines and significantly reducing pollutant emissions. This workshop aims to train participants in the design, construction, and application of dry cells for HHO gas production. Theoretical fundamentals and construction will be covered, using computational tools for calculations and design. Participants will learn how to implement this technology in internal combustion engines, promoting the reduction of emissions and greater fuel efficiency, thus contributing to sustainable mobility.',
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1166',
              title:
                  'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
            )
          ],
        ),
        Location(
          name: 'Computer Lab. A2 -  2nd floor building A',
          sessions: [
            Workshop(
              speaker: speaker7,
              technicalTrack: TechnicalTrack.infoTelecom,
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1165',
              abstract:
                  'Information security is crucial for businesses in today’s digital environment, and effective risk management is essential to mitigate threats that compromise the operating environment and organizational continuity. In this workshop we will address the key aspects of the ISO 27001 framework, as well as the models that guide the implementation of the process. In addition, we will review the main threats and vulnerabilities, applying an appropriate risk management based on the most widely used standards and catalogs in Latin America. This will allow us to assess the impact, make an accurate diagnosis and propose mitigations through safeguards, facilitating strategic decisions to improve the integral security of the organization.',
              title:
                  'Principles of information security and risk management to mitigate threats that commonly affect businesses',
            )
          ],
        ),
      ],
    ),
  ],
);

const thursday = ScheduleDay(
  day: 18,
  month: "Julio",
  weekday: "Jueves",
  timeSlots: [
    TimeSlot(
      time: "8:00",
      locations: [
        Location(
          name: "Aula Magna",
          sessions: [
            NoTechnicalSession(title: "Registration to the conference")
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "9:00 - 17:00",
      locations: [
        Location(
          name: "Aula Magna",
          sessions: [
            NoTechnicalSession(
                title:
                    "Feria de innovación tecnológica - Detras del aula magna")
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "9:30 - 10:30",
      locations: [
        Location(
          name: "Aula Magna",
          sessions: [
            NoTechnicalSession(title: "Inaugural ceremony - AULA MAGNA")
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "10:30 - 11:30",
      locations: [
        Location(
          name: "Aula magna",
          sessions: [
            KeyNote(
              speaker: speaker8,
              technicalTrack: TechnicalTrack.industry,
              registerLink: '',
              title: 'Energy, Environment, and Society',
              abstract:
                  'Energy is an essential agent for the development of society; however, its production and use have an environmental impact that negatively affects society. One of these impacts is the emission of greenhouse gases that lead to global warming. One solution is to design an energy transition plan using alternative energy sources. Wind energy and solar energy (photovoltaic and photothermal) have gained ground worldwide, but due to production restrictions, they do not represent a definitive solution. A feasible short-term solution is the use of nuclear energy using Uranium and Thorium as fuels. Whatever the plan of action and the course of action each country decides upon, it will always require a group of highly trained professionals. The youth of each nation are the human resources that, through the educational process, become the necessary human capital.',
            ),
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "12:00 - 13:00",
      locations: [
        Location(
          name: "Computer Lab. A7 -  2nd floor building A",
          sessions: [
            Workshop(
              speaker: speaker5,
              technicalTrack: TechnicalTrack.industry,
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1159',
              title: 'TICs: The future of learning',
              abstract:
                  'In the upcoming workshop, an overview of emerging trends in educational technology will be provided, enabling participants to facilitate the acquisition of practical skills and knowledge that can be directly applied in educational settings to enhance the learning experience. The workshop will offer platforms for networking, promoting collaboration and the exchange of innovative ideas. It will include case studies and concrete examples, helping to better understand how to implement these new technologies for both teachers and students. It is important to this workshop to have at least a B1 level of English proficiency.',
            ),
          ],
        ),
        Location(
          name: 'Computer Lab. A4 -  2nd floor building A',
          sessions: [
            Workshop(
              speaker: speaker6,
              technicalTrack: TechnicalTrack.mobility,
              abstract:
                  'The growing concern about the environmental impact of fossil fuels has driven the search for cleaner and more efficient energy alternatives. HHO gas (a mixture of hydrogen and oxygen) emerges as a promising solution, capable of improving combustion in traditional engines and significantly reducing pollutant emissions. This workshop aims to train participants in the design, construction, and application of dry cells for HHO gas production. Theoretical fundamentals and construction will be covered, using computational tools for calculations and design. Participants will learn how to implement this technology in internal combustion engines, promoting the reduction of emissions and greater fuel efficiency, thus contributing to sustainable mobility.',
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1166',
              title:
                  'Dry cell electrolyzer design for HHO gas production: An alternative for Sustainable Mobility',
            )
          ],
        ),
        Location(
          name: 'Computer Lab. A2 -  2nd floor building A',
          sessions: [
            Workshop(
              speaker: speaker7,
              technicalTrack: TechnicalTrack.infoTelecom,
              registerLink:
                  'https://appwfp.ups.edu.ec/foc-webins/index.xhtml?prog=1165',
              abstract:
                  'Information security is crucial for businesses in today’s digital environment, and effective risk management is essential to mitigate threats that compromise the operating environment and organizational continuity. In this workshop we will address the key aspects of the ISO 27001 framework, as well as the models that guide the implementation of the process. In addition, we will review the main threats and vulnerabilities, applying an appropriate risk management based on the most widely used standards and catalogs in Latin America. This will allow us to assess the impact, make an accurate diagnosis and propose mitigations through safeguards, facilitating strategic decisions to improve the integral security of the organization.',
              title:
                  'Principles of information security and risk management to mitigate threats that commonly affect businesses',
            )
          ],
        ),
      ],
    ),
  ],
);

const friday = ScheduleDay(
  day: 19,
  month: "Julio",
  weekday: "Viernes",
  timeSlots: [
    TimeSlot(
      time: "09:00 - 09:25",
      locations: [
        Location(
          name: "Multipurpose room 2nd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker9],
              technicalTrack: TechnicalTrack.infoTelecom,
              title:
                  'Optimization of a rectangular warehouse design using heuristics techniques',
            ),
          ],
        ),
        Location(
          name: "Multipurpose room 2nd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker10, speaker11, speaker12],
              technicalTrack: TechnicalTrack.mobility,
              title:
                  'Performance Analysis of the LiDAR-based 3D LIO-SAM Algorithm in Urban Areas: Case Study Cuenca City in the Ecuadorian Andes',
            )
          ],
        ),
        Location(
          name: "Auditorium 3rd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker13, speaker14, speaker15],
              technicalTrack: TechnicalTrack.sustainability,
              title:
                  'Analysis of UV Radiation Monitoring: Distribution of Stations in South American Countries during the Summer Season',
            )
          ],
        ),
        Location(
          name: "Auditorium 3rd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker16, speaker17, speaker18],
              technicalTrack: TechnicalTrack.industry,
              title:
                  'Classification of the severity level of breakage failure in spur gearboxes through frequency domain vibration signal analysis.',
            )
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "09:30 - 09:55",
      locations: [
        Location(
          name: "Multipurpose room 2nd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker19, speaker20, speaker21, speaker22],
              technicalTrack: TechnicalTrack.infoTelecom,
              title:
                  'An approach to bibliometric analysis of biosignal acquisition systems to determi-ne neurological and physiological aspects of driving stress',
            ),
          ],
        ),
        Location(
          name: "Multipurpose room 2nd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker23, speaker24, speaker25, speaker26],
              technicalTrack: TechnicalTrack.mobility,
              title:
                  'Effect of Oxyhydrogen gas (HHO) addition on fuel consumption of M2 category vehicle by road tests.',
            )
          ],
        ),
        Location(
          name: "Auditorium 3rd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker27, speaker28, speaker29, speaker30],
              technicalTrack: TechnicalTrack.sustainability,
              title:
                  'Impact of foreign direct investment on energy intensity: Evidence from Latin American countries',
            )
          ],
        ),
        Location(
          name: "Auditorium 3rd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker31, speaker32, speaker33],
              technicalTrack: TechnicalTrack.industry,
              title:
                  'Optimizing the Weighing Process in Frozen Shrimp Production for Export',
            )
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "10:00 - 10:25",
      locations: [
        Location(
          name: "Multipurpose room 2nd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker34, speaker35, speaker36],
              technicalTrack: TechnicalTrack.infoTelecom,
              title:
                  'JointCare: An Integrated Platform for EMG Signal Analysis in Knee Osteoarthritis Rehabilitation',
            ),
          ],
        ),
        Location(
          name: "Auditorium 3rd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker37, speaker38, speaker39, speaker40],
              technicalTrack: TechnicalTrack.sustainability,
              title:
                  'Phytochemical stimulation through the use of artisanal biols in banana seedlings Musa paradisiaca L.: A bibliometric and experimental review',
            )
          ],
        ),
        Location(
          name: "Auditorium 3rd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker41, speaker42, speaker43, speaker44],
              technicalTrack: TechnicalTrack.industry,
              title:
                  'A Six Sigma Approach to Enhancing the Production Performance of Pacific White Shrimp (Litopenaeus vannamei): A Proposal for Optimizing Stocking Density and Acclimation Methods',
            )
          ],
        ),
      ],
    ),
    TimeSlot(
      time: "10:30 - 10:55",
      locations: [
        Location(
          name: "Auditorium 3rd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker45, speaker46, speaker47, speaker48],
              technicalTrack: TechnicalTrack.sustainability,
              title:
                  'Circular economy applicable to waste from the sus-tainable production of Musa textilis in Costa Rica',
            )
          ],
        ),
        Location(
          name: "Auditorium 3rd floor building A",
          sessions: [
            PaperExhibition(
              speakers: [speaker49, speaker50, speaker51, speaker52],
              technicalTrack: TechnicalTrack.industry,
              title:
                  'Influence of Injection Molding Parameters on the Orientation of Polypropylene Lamellar Structures Using Wide-Angle X-ray Scattering (WAXS) Technique',
            )
          ],
        ),
      ],
    ),
  ],
);

const saturday = ScheduleDay(
  day: 20,
  timeSlots: [],
  weekday: "Sábado",
  month: "Julio",
);
