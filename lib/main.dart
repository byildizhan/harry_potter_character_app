import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_calismasi/bloc/home_bloc.dart';
import 'package:flutter_test_calismasi/service/character_service.dart';
import 'package:flutter_test_calismasi/view/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => HomeBloc(characterService: CharacterService()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Test',
            home: child!,
          ),
        );
      },
      child: const HomeView(),
    );
  }
}
