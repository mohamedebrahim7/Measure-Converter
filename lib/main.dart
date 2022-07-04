import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_proj/pages/home.dart';
import 'package:second_proj/providers/convert_provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyConverter()),
      ],
      child: const Root(),
    ),
  );
}

class Root extends StatelessWidget {
  const Root();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "my app ",
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blue,
          primaryColor: Colors.blue,
        ));
  }
}
