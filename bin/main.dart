import 'package:git_topology/git_topology.dart';

Future<void> main() async {
  const Context ctx = Context();

  final revisions = (await ctx.runWithStdout(
    const <String>['git', 'rev-list', '--all', '--remotes'],
  )).split('\n');

  final commits = revisions.map<Commit>(
    (String revision) => Commit(revision, ctx),
  );

  commits.forEach(print);
}
