import 'package:minha_aula_cim/app/env/env.dart';
import 'package:uno/uno.dart';

import '../domain/models/aula.dart';

final class MinhaAulaDatasource {
  final Uno client;

  MinhaAulaDatasource(this.client);

  Future<AulaFetch> listarAulasDoAluno(String ra) async {
    final response = await client.get(
      Env.api + ra,
    );

    final data = response.data as List<Map<String, dynamic>>;

    return AulaFetch.fromJson(data);
  }
}
