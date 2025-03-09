abstract class AppFailures {
  String? message;

  AppFailures(this.message);

  @override
  String toString() {
    return message ?? "Something went wrong";
  }
}
