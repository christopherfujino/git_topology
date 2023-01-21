import 'context.dart';

class Commit {
  Commit._(this.revision, this.ctx)
      : parentRevisions = _lookupParents(revision, ctx);

  factory Commit(String revision, Context ctx) {
    Commit? that = ctx.commits[revision];
    if (that != null) {
      return that;
    }
    that = Commit._(revision, ctx);
    ctx.commits[revision] = that;
    return that;
  }

  final String revision;
  final Context ctx;
  final List<String> parentRevisions;

  @override
  String toString() {
    return '${revision.substring(0, 8)} (${parentRevisions.map((String rev) => rev.substring(0, 8)).join(', ')})';
  }
}

List<String> _lookupParents(String revision, Context ctx) {
  return (ctx.runWithStdoutSync(
    <String>['git', 'show', '--no-patch', '--pretty=%P', revision],
  )).split(' ').where((String rev) => rev.isNotEmpty).toList();
}
