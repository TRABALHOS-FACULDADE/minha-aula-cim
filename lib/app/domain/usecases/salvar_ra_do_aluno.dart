import 'package:result_dart/result_dart.dart';

import '../../infra/minha_aula_repository.dart';

abstract class SalvarRADoAluno {
  AsyncResult<void, Exception> call(String ra);
}

final class SalvarRADoAlunoImpl implements SalvarRADoAluno {
  final MinhaAulaRepository repository;

  SalvarRADoAlunoImpl(this.repository);

  @override
  AsyncResult<void, Exception> call(String ra) async {
    try {
      return Success(
        repository.salvarRADoAluno(ra).then(
              (_) => _,
            ),
      );
    } catch (e) {
      return Failure(Exception(e));
    }
  }
}
