class AppRegex {
  static final RegExp email = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');

  static final RegExp password = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{6,}$');
}
