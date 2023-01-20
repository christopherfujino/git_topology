import 'dart:io' as io;
import 'package:process/process.dart';

Future<void> main() async {
  final pm = LocalProcessManager();
  final process = await pm.start(
    const <String>['git', 'log', '--reflog'],
    mode: io.ProcessStartMode.inheritStdio,
  );
  await process.exitCode;
}
