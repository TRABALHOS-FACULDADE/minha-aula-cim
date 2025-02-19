import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/base_shimmer.dart';
import '../view_model/minha_aula_notifier.dart';
import '../view_model/ra_controller.dart';
import '../widgets/aula_card_widget.dart';
import '../widgets/bottom_sheets/settings_modal_bottom_sheets.dart';
import '../widgets/bottom_sheets/utilizar_outro_ra_modal_bottom_sheet.dart';

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: ValueListenableBuilder(
            valueListenable: controller,
            builder: (_, __, ___) {
              return Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    controller.value!,
                  ),
                ],
              );
            }),
        actions: [
          IconButton(
            onPressed: () async => await showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => SettingsModalBottomSheets(
                acaoTrocarRA: () async {
                  Navigator.pop(context);

                  final ra = await showModalBottomSheet<String>(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => const UtilizarOutroRaModalBottomSheet(),
                  );

                  if (ra != null) {
                    await controller.salvarRA(ra);

                    await notifier.listarAulas(ra);
                  }
                },
              ),
            ),
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
                    return ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'Nenhuma aula a ser listada.\n\nCaso haja algum engano, comunique à secretaria ou ao coordenador do seu curso.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
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
                            ElevatedButton(
                              onPressed: () async {
                                final ra = await showModalBottomSheet<String>(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (_) =>
                                      const UtilizarOutroRaModalBottomSheet(),
                                );

                                if (ra != null) {
                                  await controller.salvarRA(ra);

                                  await notifier.listarAulas(ra);
                                }
                              },
                              child: Text(
                                'Utilizar outro RA',
                                style: TextStyle(
                                  decorationColor: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
