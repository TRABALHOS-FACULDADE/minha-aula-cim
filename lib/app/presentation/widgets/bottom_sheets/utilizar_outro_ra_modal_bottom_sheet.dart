import 'package:flutter/material.dart';
import 'package:minha_aula_cim/app/utils/is_valid_ra.dart';

class UtilizarOutroRaModalBottomSheet extends StatefulWidget {
  const UtilizarOutroRaModalBottomSheet({super.key});

  @override
  State<UtilizarOutroRaModalBottomSheet> createState() =>
      _UtilizarOutroRaModalBottomSheetState();
}

class _UtilizarOutroRaModalBottomSheetState
    extends State<UtilizarOutroRaModalBottomSheet> {
  final raTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12,
        right: 16,
        left: 16,
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                child: Text(
                  'Inserir novo RA',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Divider(),
            Flexible(
              child: TextFormField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                controller: raTextController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Insira um novo RA',
                  hintText: 'Ex: 012.345678',
                  counter: const SizedBox.shrink(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onChanged: (_) => formKey.currentState?.validate(),
                validator: (_) {
                  if (raTextController.text.length > 4 &&
                      !raTextController.text.contains('.')) {
                    return 'Insira um RA válido! Ex: 012.345678';
                  }

                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: raTextController,
              builder: (_, __, ___) => Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      raTextController.text.isValidRA
                          ? Colors.blueAccent
                          : Colors.grey[300],
                    ),
                  ),
                  onPressed: raTextController.text.isValidRA
                      ? () => Navigator.pop(
                            context,
                            raTextController.text,
                          )
                      : null,
                  child: Text(
                    'Ver minhas aulas',
                    style: TextStyle(
                      color: raTextController.text.isValidRA
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
