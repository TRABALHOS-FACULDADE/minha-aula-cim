import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SobreOAplicativoModalBottomSheet extends StatelessWidget {
  const SobreOAplicativoModalBottomSheet({super.key});

  void _launchURL(url, [LaunchMode mode = LaunchMode.platformDefault]) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: mode);
      return;
    }

    try {
      await launchUrl(uri, mode: mode);
    } catch (err) {
      throw Exception('Could not launch $url. Error: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre o Aplicativo',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const Divider(),
          Text(
            'O aplicativo foi feito para estudos do próprio desenvolvedor podendo para, além disso, tornar mais fácil o acesso dos demais estudantes às informações de suas aulas.\n\nO aplicativo é de completo código aberto, podendo outras pessoas contribuírem com seu desenvolvimento ou até mesmo extendê-lo para suas próprias versões.',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 6),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _launchURL(
                'https://github.com/TRABALHOS-FACULDADE/minha-aula-cim'),
            child: Text(
              'Repositório do projeto',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
