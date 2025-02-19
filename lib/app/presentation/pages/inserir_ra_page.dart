import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_aula_cim/app/utils/is_valid_ra.dart';

import '../view_model/ra_controller.dart';

class InserirRaPage extends StatefulWidget {
  const InserirRaPage({super.key});

  @override
  State<InserirRaPage> createState() => _InserirRaPageState();
}

class _InserirRaPageState extends State<InserirRaPage> {
  final raTextController = TextEditingController();

  final controller = Modular.get<RAController>();

  final formKey = GlobalKey<FormState>();

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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png'),
                    const SizedBox(height: 20),
                    TextFormField(
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      controller: raTextController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        counter: const SizedBox.shrink(),
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
                      onChanged: (_) => formKey.currentState?.validate(),
                      validator: (_) {
                        if (raTextController.text.length > 4 &&
                            !raTextController.text.contains('.')) {
                          return 'Insira um RA válido! Ex: 012.345678';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                      valueListenable: raTextController,
                      builder: (_, __, ___) => ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            raTextController.text.isValidRA
                                ? Colors.blueAccent
                                : Colors.grey[300],
                          ),
                        ),
                        onPressed: raTextController.text.isValidRA
                            ? () async {
                                await controller
                                    .salvarRA(raTextController.text);

                                Modular.to.navigate(
                                  './aulas',
                                );
                              }
                            : null,
                        child: Text(
                          'Ver minhas aulas',
                          style: TextStyle(
                            color: raTextController.text.isValidRA
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
