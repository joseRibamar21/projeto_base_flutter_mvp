import 'package:flutter/material.dart';

class CustomInputPassword extends StatefulWidget {
  final Stream<String>? passwordErrorStream;
  final Function(String)? validade;
  const CustomInputPassword(
      {Key? key, required this.passwordErrorStream, required this.validade})
      : super(key: key);

  @override
  State<CustomInputPassword> createState() => _CustomInputEmailState();
}

class _CustomInputEmailState extends State<CustomInputPassword> {
  late bool _obscure = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: widget.passwordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            obscureText: _obscure,
            decoration: InputDecoration(
              labelText: 'Senha',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                icon: _obscure
                    ? const Icon(Icons.remove_red_eye_outlined)
                    : const Icon(Icons.remove_red_eye),
              ),
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
            ),
            onChanged: widget.validade,
          );
        });
  }
}
