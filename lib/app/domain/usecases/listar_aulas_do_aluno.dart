import 'package:result_dart/result_dart.dart';

import '../../infra/minha_aula_repository.dart';
import '../models/aula.dart';

abstract class ListarAulasDoAluno {
  AsyncResult<AulaFetch, Exception> call(String ra);
}

final class ListarAulasDoAlunoImpl implements ListarAulasDoAluno {
  final MinhaAulaRepository repository;

  ListarAulasDoAlunoImpl(this.repository);

  @override
  AsyncResult<AulaFetch, Exception> call(String ra) async {
    try {
      return Success(
        await repository.listarAulasDoAluno(ra),
      );
    } catch (e) {
      return Failure(Exception(e));
    }
  }
}
