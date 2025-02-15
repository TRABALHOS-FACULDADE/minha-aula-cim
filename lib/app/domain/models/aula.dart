final class AulaFetch {
  final List<Aula> content;

  AulaFetch(this.content);

  factory AulaFetch.fromJson(dynamic list) => AulaFetch(
        (list as List<dynamic>).map(Aula.fromJson).toList(),
      );
}

final class Aula {
  final String professor;
  final String turno;
  final String codigoTurma;
  final String curso;
  final String disciplina;
  final String predio;
  final String bloco;
  final String sala;
  final String horaInicial;
  final String horaFinal;
  final String data;
  final String? subTurma;

  Aula({
    required this.professor,
    required this.turno,
    required this.codigoTurma,
    required this.curso,
    required this.disciplina,
    required this.predio,
    required this.bloco,
    required this.sala,
    required this.horaInicial,
    required this.horaFinal,
    required this.data,
    required this.subTurma,
  });

  factory Aula.fromJson(dynamic json) => Aula(
        professor: json['professor'],
        turno: json['turno'],
        codigoTurma: json['codTurma'],
        curso: json['curso'],
        disciplina: json['disciplina'],
        predio: json['predio'],
        bloco: json['bloco'],
        sala: json['sala'],
        horaInicial: json['horaInicial'],
        horaFinal: json['horaFinal'],
        data: json['data'],
        subTurma: json['subTurma'],
      );
}
