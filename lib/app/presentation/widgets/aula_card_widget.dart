import 'package:flutter/material.dart';

import '../../domain/models/aula.dart';

class AulaCardWidget extends StatelessWidget {
  final Aula aula;

  const AulaCardWidget(this.aula, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 6,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            aula.disciplina,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                color: Colors.blueAccent,
              ),
              Text(
                'Horário: ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                '${aula.horaInicial} - ${aula.horaFinal}',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.domain,
                color: Colors.blueAccent,
              ),
              Text(
                'Prédio: ',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                aula.predio,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                Icons.location_city,
                color: Colors.blueAccent,
              ),
              Text(
                'Bloco: ',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                aula.bloco,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.blueAccent,
              ),
              Text(
                'Sala: ',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Flexible(
                child: Text(
                  aula.sala,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.person_2_outlined,
                color: Colors.blueAccent,
              ),
              Text(
                'Professor(a): ',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Flexible(
                child: Text(
                  aula.professor,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
