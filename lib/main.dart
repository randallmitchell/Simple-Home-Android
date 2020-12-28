import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_homescreen_flutter/models/applications.dart';
import 'package:simple_homescreen_flutter/screens/ApplicationList.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationModel(),
      child: MaterialApp(
        initialRoute: '/',
          routes: {
            '/': (context) => ApplicationList()
          }
      ),
    )
  );
}
