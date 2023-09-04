import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';

class NotificationsStorage {
  static Future<String> _localPath() async {
    final directory = await getApplicationCacheDirectory();

    return directory.path;
  }

  static Future<File> _localFile() async {
    final path = await _localPath();
    return File('$path/notifications.json');
  }

  static Future<List<ParsedNotification>> readNotifications() async {
    try {
      final file = await _localFile();

      // Read the file
      final contents = await file.readAsString();

      return json.decode(contents);
    } catch (e) {
      return [];
    }
  }

  static Future<File> writeNotifications(ParsedNotification parsedNotification) async {
    final file = await _localFile();

    final contents = parsedNotification.toJson();

    // Write the file
    return file.writeAsString('$contents', mode: FileMode.append);
  }
}
