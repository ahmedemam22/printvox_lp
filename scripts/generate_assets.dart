import 'dart:io';

void main() {
  final assetsDir = Directory('assets');
  if (!assetsDir.existsSync()) {
    print('Assets directory not found');
    return;
  }

  final buffer = StringBuffer();
  buffer.writeln('// Generated file. Do not edit manually.');
  buffer.writeln('class AppAssets {');
  buffer.writeln('  AppAssets._();');
  buffer.writeln('');

  _processDirectory(assetsDir, buffer, '');

  buffer.writeln('}');

  final outputFile = File('lib/core/constants/assets.dart');
  outputFile.parent.createSync(recursive: true);
  outputFile.writeAsStringSync(buffer.toString());

  print('Assets generated at lib/core/constants/assets.dart');
}

void _processDirectory(Directory dir, StringBuffer buffer, String prefix) {
  final entities = dir.listSync();
  for (final entity in entities) {
    if (entity is File) {
      final path = entity.path.replaceAll('\\', '/');
      final fileName = entity.uri.pathSegments.last;
      final variableName = _toVariableName(path);
      buffer.writeln('  static const String $variableName = \'$path\';');
    } else if (entity is Directory) {
      _processDirectory(entity, buffer, prefix);
    }
  }
}

String _toVariableName(String path) {
  // Remove assets/ and extension
  var name = path.replaceFirst('assets/', '');
  final dotIndex = name.lastIndexOf('.');
  if (dotIndex != -1) {
    name = name.substring(0, dotIndex);
  }

  // Convert to camelCase
  final segments = name.split(RegExp(r'[/_-]'));
  var result = segments[0];
  for (var i = 1; i < segments.length; i++) {
    if (segments[i].isEmpty) continue;
    result += segments[i][0].toUpperCase() + segments[i].substring(1);
  }
  return result;
}
