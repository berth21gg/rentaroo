import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/home.dart';
import 'package:rentaroo/providers/count_provider.dart';
import 'package:rentaroo/providers/rent_list_provider.dart';
import 'package:rentaroo/providers/rent_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ocultar Navigation Bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountModel>(
          create: (_) => CountModel(),
        ),
        ChangeNotifierProvider<RentListProvider>(
          create: (_) => RentListProvider(),
        ),
        ChangeNotifierProvider<RentProvider>(
          create: (_) => RentProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Rentaroo',
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
          primary: Color(0xffbb9c36),
          secondary: Color(0xff794328),
          background: Color(0xffd4c4bc),
        )),
        home: const Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
