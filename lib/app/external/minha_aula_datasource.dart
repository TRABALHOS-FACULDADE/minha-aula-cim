import 'dart:convert';

import 'package:flutter/foundation.dart';
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

    if (kDebugMode && data.isEmpty) {
      return AulaFetch.fromJson(
        jsonDecode(
          '''
          [
  {
    "professor": "Fábio Fonseca Barbosa Gomes",
    "turno": "DIURNO",
    "codTurma": "20212GRDECPDIU",
    "dtInicial": "2025-02-10T00:00:00",
    "dtFinal": "2025-07-12T00:00:00",
    "curso": "Engenharia de Computação",
    "disciplina": "Redes de Computadores III",
    "predio": "CIMATEC 1",
    "bloco": "2º ANDAR",
    "sala": "TELECOMUNICAÇÕES",
    "data": "14/02/2025",
    "horaInicial": "18:30",
    "horaFinal": "20:10",
    "subTurma": null
  },
  {
    "professor": "Osvaldo Requião Melo",
    "turno": "DIURNO",
    "codTurma": "20201GRDECPDIU",
    "dtInicial": "2025-02-10T00:00:00",
    "dtFinal": "2025-07-12T00:00:00",
    "curso": "Engenharia de Computação",
    "disciplina": "Compiladores",
    "predio": "CIMATEC 2",
    "bloco": "2º ANDAR",
    "sala": "2-2-05 - Eixo integrativo - Cor VERDE",
    "data": "14/02/2025",
    "horaInicial": "20:20",
    "horaFinal": "22:00",
    "subTurma": null
  }
]
          ''',
        ),
      );
    }

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
