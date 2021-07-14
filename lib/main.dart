import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_dummy/model_view/news_mv.dart';
import 'package:provider/provider.dart';
import 'view/home.dart';
import 'view/news_detail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewsMV()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "News Dummy",
        theme: ThemeData(
            appBarTheme: const AppBarTheme(),
            primarySwatch: Colors.pink,
            accentColor: Colors.pinkAccent),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
          '/detail': (context) => const NewsDetail()
        },
      ),
    );
  }
}
