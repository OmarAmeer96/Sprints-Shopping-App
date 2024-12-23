import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprints_shopping_app/core/helpers/simple_bloc_observer.dart';
import 'package:sprints_shopping_app/core/routing/app_router.dart';
import 'package:sprints_shopping_app/pixels_app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  // setupGetIt();
  Bloc.observer = SimpleBlocObserver();
  await ScreenUtil.ensureScreenSize();

  runApp(
    PixelsApp(
      appRouter: AppRouter(),
    ),
  );
}
