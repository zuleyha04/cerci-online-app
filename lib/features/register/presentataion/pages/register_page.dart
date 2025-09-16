import 'package:cerci_online/common/widgets/appBar/secondary_app_bar.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Register", showBack: true),
      body: Center(child: Text("Kayıt ol / Giriş yap")),
    );
  }
}
