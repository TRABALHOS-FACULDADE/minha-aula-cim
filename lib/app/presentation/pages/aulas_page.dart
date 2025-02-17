import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/base_shimmer.dart';
import '../view_model/minha_aula_notifier.dart';
import '../view_model/ra_controller.dart';
import '../widgets/aula_card_widget.dart';

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
    if (controller.value == null) {
      Modular.to.navigate('../');

      return;
    }

    notifier.listarAulas(controller.value!);

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
            onPressed: () => Modular.to.pushNamed('./settings'),
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
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Center(
                            heightFactor: 4,
                            child: Text(
                              'Nenhuma aula a ser listada.\n\nCaso haja algum engano, comunique à secretaria ou ao coordenador do seu curso.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () async => notifier.listarAulas(
                              controller.value!,
                            ),
                            child: Text(
                              'Recarregar',
                              style: TextStyle(
                                decorationColor: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return Expanded(
                    child: RefreshIndicator(
                      color: Colors.blueAccent,
                      onRefresh: () async => notifier.listarAulas(
                        controller.value!,
                      ),
                      child: ListView.builder(
                        itemCount: aulas.length,
                        itemBuilder: (_, index) => AulaCardWidget(
                          aulas[index],
                        ),
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(
                        5,
                        (_) => BaseShimmer(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                            height: 100,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
