import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizgame/core/sharedWidgets/Loading.dart';
import 'package:quizgame/viewModels/auth/auth_view_model.dart';
import 'auth_wrapper.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return authViewModel.loading ? Loading() : AuthWrapper();
  }
}
