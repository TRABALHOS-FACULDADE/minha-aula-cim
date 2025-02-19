import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
          onTap: !kDebugMode
              ? null
              : () async => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
          leading: Icon(Icons.api),
          title: Text('API'),
          trailing: Text(
            '(Em construção)',
            style: TextStyle(
              fontSize: 15,
              color: Colors.red,
            ),
          ),
        ),
        ListTile(
          onTap: !kDebugMode
              ? null
              : () async => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
          leading: Icon(Icons.info_outline),
          title: Text('Sobre o aplicativo'),
          trailing: Text(
            '(Em construção)',
            style: TextStyle(
              fontSize: 15,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
