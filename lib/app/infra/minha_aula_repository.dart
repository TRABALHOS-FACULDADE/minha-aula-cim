import '../domain/models/aula.dart';
import '../external/minha_aula_datasource.dart';

final class MinhaAulaRepository {
  final MinhaAulaDatasource datasource;

  MinhaAulaRepository(this.datasource);

  Future<AulaFetch> listarAulasDoAluno(String ra) async =>
      datasource.listarAulasDoAluno(ra);

  Future<void> salvarRADoAluno(String ra) async =>
      datasource.salvarRADoAluno(ra);

  Future<String?> pegarRADoAluno() async => datasource.pegarRADoAluno();
}
