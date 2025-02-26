import 'package:flutter/material.dart';

import 'sobre_a_api_modal_bottom_sheet.dart';
import 'sobre_o_aplicativo_modal_bottom_sheet.dart';

class SettingsModalBottomSheets extends StatelessWidget {
  final VoidCallback acaoTrocarRA;

  const SettingsModalBottomSheets({
    super.key,
    required this.acaoTrocarRA,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Text(
            'Configurações',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
        ),
        ListTile(
          onTap: acaoTrocarRA,
          leading: Icon(Icons.change_circle_outlined),
          title: Text('Utilizar outro RA'),
        ),
        ListTile(
          onTap: () async => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) => const SobreAApiModalBottomSheet(),
          ),
          leading: Icon(Icons.api),
          title: Text('API'),
        ),
        ListTile(
          onTap: () async => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) => const SobreOAplicativoModalBottomSheet(),
          ),
          leading: Icon(Icons.info_outline),
          title: Text('Sobre o aplicativo'),
        ),
      ],
    );
  }
}
