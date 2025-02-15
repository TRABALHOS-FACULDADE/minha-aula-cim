import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view_model/ra_controller.dart';

class InserirRaPage extends StatefulWidget {
  const InserirRaPage({super.key});

  @override
  State<InserirRaPage> createState() => _InserirRaPageState();
}

class _InserirRaPageState extends State<InserirRaPage> {
  final raTextController = TextEditingController();

  final controller = Modular.get<RAController>();

  @override
  void initState() {
    controller.pegarRA().then((_) {
      final value = controller.value;

      if (value != null && value.isNotEmpty) {
        Modular.to.pushNamed(
          './aulas',
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (_, value, __) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: raTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.salvarRA(raTextController.text);

                      Modular.to.pushNamed(
                        './aulas',
                      );
                    },
                    child: Text(
                      'Ver aulas',
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
