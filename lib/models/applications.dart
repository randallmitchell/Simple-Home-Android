
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:launcher_assist/launcher_assist.dart';

class ApplicationModel with ChangeNotifier {

  final List<Application> _items = [];

  ApplicationModel() {
    init();
  }

  void setApplications(List<Application> applications) {
    assert(applications != null);
    assert(applications.isNotEmpty);

    _items.clear();
    _items.addAll(applications);

    notifyListeners();
  }

  List<Application> get items => _items;

  Application getByPosition(int position) {
    return _items[position];
  }

  void init() async {
    print("applications.init");
    LauncherAssist.getAllApps().then((apps) {
      final List<Application> applications = List.from(
          apps.map((app) => Application(
              app["package"],
              app["label"],
              app["icon"]
          ))
      );
      applications.sort((a, b) => a.name.compareTo(b.name));
      setApplications(applications);
      notifyListeners();
    });
  }
}

@immutable
class Application {
  final String id;
  final String name;
  final Uint8List icon;

  const Application(this.id, this.name, this.icon);

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) => other is Application && other.id == id;
}
