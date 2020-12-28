import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:provider/provider.dart';
import 'package:simple_homescreen_flutter/models/applications.dart';

class ApplicationList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: _ApplicationList(),
      ),
    );
  }
}

class _ApplicationList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var applicationModel = context.watch<ApplicationModel>();

    return ListView.builder(
      itemCount: applicationModel.items.length,
      itemBuilder: (context, index) => ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        leading: Image.memory(applicationModel.items[index].icon),
        title: Text(
          applicationModel.items[index].name
        ),
        onTap: () => LauncherAssist.launchApp(applicationModel.items[index].id),
        autofocus: true,
      ),
    );
  }
}
