import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import './utils/custom_colors.dart';
import './routing/route_generator.dart';
import './view/pages/contact_list_screen.dart';
import './injection_container.dart' as dependency_injection;
import 'injection_container.dart';
import 'view_model/contact_view_model.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dependency_injection.init();

  runApp(const ContactApp());
  
}

class ContactApp extends StatelessWidget {

  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactViewModel>(create: (_) => getIt<ContactViewModel>()),
      ],
      child: GetMaterialApp(
        title: 'Contact App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          highlightColor: CustomColors.highlightColor,
          backgroundColor: CustomColors.backgroundColor,
          canvasColor: CustomColors.backgroundColor,
          textTheme: TextTheme(
            headline5: ThemeData.light()
                .textTheme
                .headline5!
                .copyWith(color: CustomColors.accentColor),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: CustomColors.accentColor,
            foregroundColor: Colors.white,
            actionsIconTheme: IconThemeData(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => CustomColors.accentColor),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith(
                (states) => CustomColors.accentColor,
              ),
              side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(color: CustomColors.accentColor)),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: ContactListScreen.routeName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );

  }

}