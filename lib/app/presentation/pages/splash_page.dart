import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view_model/ra_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Modular.get<RAController>();

  @override
  void initState() {
    controller.pegarRA().then((_) {
      final value = controller.value;

      Modular.to.navigate(
        (value != null && value.isNotEmpty) ? './aulas' : './inserirRA',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MINHA AULA',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
