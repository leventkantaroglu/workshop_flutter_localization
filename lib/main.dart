import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
        //  ...AppLocalizations.localizationsDelegates,
      ],

      /// default: [const Locale('en', 'US')]
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('tr', 'TR'),
        //Locale('ar', 'SA'),
      ],
      home: MyHomePage(title: 3721963.5.toString()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Localizations.override(
          context: context,
          locale: const Locale('ar', 'SA'),
          child: BackButton(
            onPressed: () {
              print(Platform.localeName);
              print(
                Localizations.localeOf(context).toString(),
              );
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Levent Kantaroğlu"),
              trailing: Icon(Icons.menu),
            ),
            Text(Platform.localeName),
            Text(Localizations.localeOf(context).toString()),
            Text(MaterialLocalizations.of(context).backButtonTooltip),
            Text(AppLocalizations.of(context)!.helloWorld),
          ],
        ),
      ),
    );
  }
}
