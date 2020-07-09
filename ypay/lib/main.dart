import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ypay/Page/LoginPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/appLanguage.dart';
import 'localization/AppLocalization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(
    MyApp(appLanguage: appLanguage,)
  );
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
        create: (_) => AppLanguage(),
        child: Consumer<AppLanguage>(builder: (context, model, child) {
          return MaterialApp(
            supportedLocales: [
              Locale('en', 'US'),
              Locale('my', 'MY'),
              Locale('zh', 'CN'),

            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginPage(),
          );
        }
    ));
  }
  
}



