import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Espere un momento'),
      content: const Text('Se está consultando la información...'),
      icon: const Icon(FontAwesomeIcons.globe),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: styles.getRoundedButtonStyle(),
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
