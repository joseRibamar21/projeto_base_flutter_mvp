import 'package:flutter/material.dart';

class LoginOptionsUser extends StatelessWidget {
  final PageController? controller;
  const LoginOptionsUser({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () => controller?.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
              child: const Text("Usuário"),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          SizedBox(
            height: 50,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () => controller?.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
              child: const Text("Posto"),
            ),
          ),
        ],
      ),
    );
  }
}
