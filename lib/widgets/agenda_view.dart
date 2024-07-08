import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'full_agenda_body.dart';

class AgendaView extends StatefulWidget {
  const AgendaView();

  @override
  State<AgendaView> createState() => _AgendaViewState();
}

class _AgendaViewState extends State<AgendaView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Completa',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Mi agenda',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const Gap(8),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                FullAgendaBody(),
                Center(
                  child: Text("No hay workshops agregados"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
