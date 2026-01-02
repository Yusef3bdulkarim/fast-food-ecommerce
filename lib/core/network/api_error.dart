class ApiError {
  final String message;
  final int? stutesCode;

  ApiError({required this.message, this.stutesCode});
  @override
  String toString() {
    return "error message is: $message stutes Code is: $stutesCode";
  }
}
