import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view_model/minha_aula_notifier.dart';
import '../view_model/ra_controller.dart';

class AulasPage extends StatefulWidget {
  const AulasPage({super.key});

  @override
  State<AulasPage> createState() => _AulasPageState();
}

class _AulasPageState extends State<AulasPage> {
  final notifier = Modular.get<MinhaAulaNotifier>();
  final controller = Modular.get<RAController>();

  @override
  void initState() {
    notifier.listarAulas('019.705118');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.value!,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: notifier,
              builder: (_, state, __) {
                if (state is MinhaAulaErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is MinhaAulaSuccessState) {
                  final aulas = state.aulas.content;

                  if (aulas.isEmpty) {
                    return Center(
                      child: Text('Sem aula hoje'),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: aulas.length,
                      itemBuilder: (_, index) {
                        final aula = aulas[index];

                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                aula.disciplina,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Horário: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  Text(
                                    '${aula.horaInicial} - ${aula.horaFinal}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(
                                    Icons.domain,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Prédio: ',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    aula.predio,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Bloco: ',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    aula.bloco,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Sala: ',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      aula.sala,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Professor(a): ',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      aula.professor,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
