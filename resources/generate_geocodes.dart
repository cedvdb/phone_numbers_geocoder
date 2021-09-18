import 'dart:io';

import 'read_geo_codes.dart';

/// separate file for generating geocodes because it takes a long, long time
/// to process

void main() async {
  final geocodes = await getGeocodes();
  await writeGeoCodeMapFile(geocodes);
}

Future writeGeoCodeMapFile(Map<String, String> geocodes) async {
  print(geocodes.length);
  var content = 'const geoCodes = {%%};';
  var body = '';
  geocodes.forEach((key, value) {
    body += '"$key": "$value",';
  });
  content = content.replaceFirst('%%', body);
  final file =
      await File('lib/src/generated/geocodes.dart').create(recursive: true);
  await file.writeAsString(content);
}
