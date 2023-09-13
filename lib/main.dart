import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizgame/core/utils/color.dart';
import 'package:quizgame/viewModels/auth/auth_view_model.dart';
import 'package:quizgame/viewModels/home/category/category_view_model.dart';
import 'package:quizgame/viewModels/home/bcs/bcq_view_model.dart';
import 'package:quizgame/viewModels/home/challengeRoom/challenge_room_view_model.dart';
import 'package:quizgame/viewModels/home/home_view_model.dart';
import 'package:quizgame/viewModels/home/runningTournament/running_tournament_view_model.dart';
import 'package:quizgame/viewModels/play/question_view_model.dart';
import 'package:quizgame/viewModels/shop/shop_view_model.dart';
import 'package:quizgame/viewModels/user/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:quizgame/views/wrapper/main_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
        ChangeNotifierProvider<ChallengeRoomViewModel>(
            create: (_) => ChallengeRoomViewModel()),
        ChangeNotifierProvider<RunningTournamentViewModel>(
            create: (_) => RunningTournamentViewModel()),
        ChangeNotifierProvider<BcsViewModel>(create: (_) => BcsViewModel()),
        ChangeNotifierProvider<CategoryViewModel>(
            create: (_) => CategoryViewModel()),
        ChangeNotifierProvider<ShopVIewModel>(create: (_) => ShopVIewModel()),
        ChangeNotifierProvider<QuestionViewModel>(
            create: (_) => QuestionViewModel()),
      ],
      child: MaterialApp(
        title: 'Quiz House',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(primaryColor),
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainWrapper(),
      ),
    );
  }
}
