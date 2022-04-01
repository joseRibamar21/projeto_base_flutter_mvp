import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class CustomInputCPF extends StatefulWidget {
  final Stream<String>? cpfErrorStream;
  final Function(String)? validade;
  const CustomInputCPF(
      {Key? key, required this.cpfErrorStream, required this.validade})
      : super(key: key);

  @override
  State<CustomInputCPF> createState() => _CustomInputCPFState();
}

class _CustomInputCPFState extends State<CustomInputCPF> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = MaskedTextController(mask: '000.000.000-00');
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.cpfErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'CPF',
            errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            widget.validade!(value);
          },
        );
      },
    );
  }
}
