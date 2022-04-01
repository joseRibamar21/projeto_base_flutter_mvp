import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import './login.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Provider(
        create: (_) => widget.presenter,
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(height: sizeHeight / 11),
                CircleAvatar(
                  backgroundColor: Colors.green[900],
                  child: Image.asset(
                    "lib/ui/assets/pngegg.png",
                    color: Colors.white,
                  ),
                  radius: 90,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 350,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      LoginFormUser(controller: _pageController),
                      const Center(
                        child: Text("Posto"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Entrar"),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text("Não possui cadastro?"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFormUser extends StatelessWidget {
  final PageController? controller;
  const LoginFormUser({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var presenter = Provider.of<LoginPresenter>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          CustomInputCPF(
              cpfErrorStream: presenter.cpfErrorStream,
              validade: presenter.validadeCPF),
          const SizedBox(height: 10),
          CustomInputPassword(
              passwordErrorStream: presenter.passwordErrorStream,
              validade: presenter.validadePassword),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text("Esqueceu a senha?"),
            ),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => controller?.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
              child: const Text("Usuário Posto?"),
            ),
          ),
        ],
      ),
    );
  }
}
