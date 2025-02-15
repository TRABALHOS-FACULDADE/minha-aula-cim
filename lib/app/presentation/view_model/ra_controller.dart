import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/usecases/pegar_ra_do_aluno.dart';
import '../../domain/usecases/salvar_ra_do_aluno.dart';

final class RAController extends ValueNotifier<String?> {
  RAController() : super(null);

  Future<void> pegarRA() async {
    value = (await Modular.get<PegarRADoAluno>().call()).fold(
      (ra) => ra,
      (falha) => null,
    );
  }

  Future<void> salvarRA(String ra) async {
    value = ra;

    await Modular.get<SalvarRADoAluno>().call(ra);
  }
}
