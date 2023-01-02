extension NavigatorExtensionsUtils on String {
  // check if name for registration is good.
  bool? get emailErrorText {
    var regex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return (regex.hasMatch(this));
  }

  bool? get passErrorText {
    var passwordRegex = RegExp(r"(?=.*[a-z])(?=.*[A-Z]).{8,}");
    return passwordRegex.hasMatch(this);
  }
}
