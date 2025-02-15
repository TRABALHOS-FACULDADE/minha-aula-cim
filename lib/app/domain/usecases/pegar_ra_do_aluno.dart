import 'package:result_dart/result_dart.dart';

import '../../infra/minha_aula_repository.dart';

abstract class PegarRADoAluno {
  AsyncResult<String, Exception> call();
}

final class PegarRADoAlunoImpl implements PegarRADoAluno {
  final MinhaAulaRepository repository;

  PegarRADoAlunoImpl(this.repository);

  @override
  AsyncResult<String, Exception> call() async {
    try {
      return Success(
        (await repository.pegarRADoAluno()) ?? '',
      );
    } catch (e) {
      return Failure(Exception(e));
    }
  }
}
