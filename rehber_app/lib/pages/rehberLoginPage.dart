import 'package:flutter/material.dart';

class RehberLoginPage extends StatefulWidget {
  const RehberLoginPage({super.key});

  @override
  State<RehberLoginPage> createState() => _RehberLoginPageState();
}

class _RehberLoginPageState extends State<RehberLoginPage> {
  bool obscurePassword = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rehber Login Page'),
        backgroundColor: Colors.blue,
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
                    color: Colors.blue,
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
                                    color: Colors.blueAccent,
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
                                    color: Colors.blue,
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
                      onPressed: () {
                        // Handle rehber login
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      "Kayıt Ol!",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
