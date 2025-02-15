import 'package:flutter_auto_cache/flutter_auto_cache.dart';
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

    final data = response.data as List<dynamic>;

    return AulaFetch.fromJson(data);
  }

  Future<void> salvarRADoAluno(String ra) async {
    await AutoCache.data.saveString(key: 'aluno_ra', data: ra);
  }

  Future<String?> pegarRADoAluno() async {
    final response = await AutoCache.data.getString(key: 'aluno_ra');

    return response.data;
  }
}
