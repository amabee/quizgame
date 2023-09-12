import 'package:flutter/material.dart';
import 'package:quiz/viewModels/auth/auth_view_model.dart';
import 'package:quiz/views/auth/login_view.dart';
import 'package:quiz/views/home/home_view.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return authViewModel.isLogin ? HomeView() : LoginView();
  }
}
