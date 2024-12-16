import 'package:flutter/material.dart';
import 'package:rehber_app/main.dart';
import 'package:rehber_app/pages/registerPage.dart';
import 'guidePages/rehberLoginPage.dart'; // Import the RehberLogin page
import '../utils/colors.dart'; // Import colors
import '../services/loginService.dart'; // Import the login service
import 'homePage.dart'; // Import the HomePage
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    int responseCode = await LoginService.login(username, password);
    print('Login response code: $responseCode');
    if (responseCode != 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('traveller_id', responseCode); // Save responseCode as traveller_id
      print('Saved traveller_id: $responseCode'); // Print the saved traveller_id
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Giriş başarısız. Lütfen tekrar deneyin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
               title: Text(' Login Page',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),),
        backgroundColor: rehberBlue, // Changed color
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 355,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Card(
                    color: rehberBlue, // Changed color
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            "RehberApp'e Hoş Geldin!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: rehberBlue, // Changed color
                                    width: 2.0,
                                  ),
                                ),
                                hintText: "Kullanıcı Adınızı Giriniz",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: obscurePassword,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: rehberBlue, // Changed color
                                    width: 2.0,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                  icon: Icon(obscurePassword
                                      ? Icons.lock_open
                                      : Icons.lock),
                                ),
                                hintText: "Şifrenizi Giriniz",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, bottom: 30, top: 5),
                              child: TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             ForgotPassword()));
                                  },
                                  child: Text(
                                    "Şifremi Unuttum?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30),
              child: SizedBox(
                  width: 330,
                  child: ElevatedButton(
                      onPressed: _login, // Use the _login method
                      style: ElevatedButton.styleFrom(
                          backgroundColor: rehberBlue, // Changed color
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("Giriş Yap"),
                      ))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hesabın yok mu?",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      "Kayıt Ol!",
                      style: TextStyle(
                          color: rehberBlue, // Changed color
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rehberler için",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RehberLoginPage()));
                      },
                      child: Text(
                        "Giriş Yap!",
                        style: TextStyle(
                            color: rehberBlue, // Changed color
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}