import 'dart:io' as io;

void main() {
  final fooFuture = foo().then(() => print('foo completed'));
  print('back in main');
}

Future<void> foo() {
  final Future<void> done = io.File('foo')
      .readAsString()
      .then<void>((String contents) => print(contents));
  return done;
}

Future<void> foo2() async {
  final contents = await io.File('foo').readAsString();
  print(contents);
}
