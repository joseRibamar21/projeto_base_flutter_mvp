import 'package:flutter/material.dart';

class CustomInputEmail extends StatelessWidget {
  final Stream<String> emailErrorStream;
  final Function(String)? validade;
  const CustomInputEmail(
      {Key? key, required this.emailErrorStream, required this.validade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: emailErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: validade,
        );
      },
    );
  }
}
