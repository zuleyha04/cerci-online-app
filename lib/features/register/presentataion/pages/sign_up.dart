import 'package:cerci_online/common/widgets/buttons/common_button.dart';
import 'package:cerci_online/core/helpers/top_snackbar_helper.dart';
import 'package:cerci_online/features/register/presentataion/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCloseButton(context),
              _buildTitle(),
              SizedBox(height: 30.h),
              _buildEmailField(),
              SizedBox(height: 20.h),
              _buildPasswordField(),
              SizedBox(height: 40.h),
              _buildSignUpButton(context),
              SizedBox(height: 20.h),
              _buildSignInText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(Icons.close, size: 28),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Kayıt Ol',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Şifre',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
      obscureText: _obscurePassword,
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return CommonButton(
      text: 'Kayıt Ol',
      onPressed: () {
        TopSnackbarHelper.showInfo(context, 'Sign up tıklandı');
      },
    );
  }

  Widget _buildSignInText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Mevcut hesabın var mı ? "),
          TextSpan(
            text: 'Giriş Yap',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
