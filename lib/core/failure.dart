abstract class Failure {
  abstract final String message;
}

class ApiFailure extends Failure {
  final String msg;

  ApiFailure({required this.msg});
  @override
  String get message => msg;
}
