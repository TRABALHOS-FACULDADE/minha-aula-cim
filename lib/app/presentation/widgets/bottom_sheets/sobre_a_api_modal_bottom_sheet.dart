import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SobreAApiModalBottomSheet extends StatelessWidget {
  const SobreAApiModalBottomSheet({super.key});

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
            'API',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const Divider(),
          Text(
            'A API utilizada foi obtida por meio do método de "Inspeção de Elementos" > "Network", presente na grande maioria dos navegadores, no site padrão utilizado pelos aluno:',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 6),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _launchURL('https://senaiweb.fieb.org.br/MinhaAula/'),
            child: Text(
              'Site - MinhaAula',
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
