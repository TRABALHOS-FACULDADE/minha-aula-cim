import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/models/aula.dart';
import '../../domain/usecases/listar_aulas_do_aluno.dart';

part 'minha_aula_state.dart';

final class MinhaAulaNotifier extends ValueNotifier<MinhaAulaState> {
  MinhaAulaNotifier() : super(MinhaAulaInitialState());

  Future<void> listarAulas(String ra) async {
    value = MinhaAulaLoadingState();

    value = ((await Modular.get<ListarAulasDoAluno>().call(ra)).fold(
      MinhaAulaSuccessState.new,
      (falha) => MinhaAulaErrorState(falha.toString()),
    ));
  }
}
