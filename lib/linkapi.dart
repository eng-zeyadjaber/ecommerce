class AppLink {
  static const String server = "http://ecommercezeyad.atwebpages.com";
  static const String imageStatic =
      "http://ecommercezeyad.atwebpages.com/upload";
  static const String test = "$server/test2.php";

  // auth
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodesignup = "$server/auth/verfiycode.php";

  // forgetpassword
  static const String checkEmail = "$server/forgetpass/checkemail.php";
  static const String resetpass = "$server/forgetpass/resetpass.php";
  static const String verifycodeforgetpass =
      "$server/forgetpass/verifycode.php";

  // Home
  static const String homepage = "$server/home.php";

  // image
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
}
