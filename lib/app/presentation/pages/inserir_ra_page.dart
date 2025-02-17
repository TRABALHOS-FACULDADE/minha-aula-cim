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
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    controller: raTextController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Insira seu RA',
                      hintText: 'Ex: 012.345678',
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

                      Modular.to.navigate(
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
