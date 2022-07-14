import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  _textField({required String labelText, onChanged, Function()? errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'Name',
                onChanged: controller.client.changeName,
                errorText: controller.validateName,
              );
            },
          ),
          const SizedBox(height: 10),
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'E-mail',
                onChanged: controller.client.changeEmail,
                errorText: controller.validateEmail,
              );
            },
          ),
          const SizedBox(height: 25),
          Observer(builder: (_) {
            return ElevatedButton(
              onPressed: controller.isValid ? () {} : null,
              child: const Text("Salvar"),
            );
          }),
        ],
      ),
    );
  }
}
