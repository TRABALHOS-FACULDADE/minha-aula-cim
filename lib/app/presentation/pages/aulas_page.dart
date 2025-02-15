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
      ),
      body: Column(
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

                      return ListTile(
                        title: Text(
                          aula.disciplina,
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
    );
  }
}
