import 'package:process/process.dart';

import 'commit.dart';

class Context {
  Context();

  final _pm = const LocalProcessManager();
  final commits = <String, Commit>{};

  Future<String> runWithStdout(List<String> command) async {
    final result = await _pm.run(command);

    if (result.exitCode != 0) {
      throw 'foo bar';
    }

    // TODO log stderr

    return (result.stdout as String).trim();
  }

  String runWithStdoutSync(List<String> command) {
    final result = _pm.runSync(command);

    if (result.exitCode != 0) {
      throw 'foo bar';
    }

    // TODO log stderr

    return (result.stdout as String).trim();
  }
}
