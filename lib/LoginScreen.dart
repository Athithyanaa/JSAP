import 'package:flutter/material.dart';
import 'package:jsap/UserTypeSelectionPage.dart';
import 'package:jsap/VerificationPage.dart';
import 'HomePage.dart';
import 'SignUpPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget buildUsername() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'UserEmail',
        prefixIcon: Icon(
          Icons.account_circle_sharp,
          color: Colors.indigo,
          size: 40,
        ),
      ),
    );
  }

  Widget buildPassword() {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.indigo,
          size: 40,
        ),
      ),
      obscureText: true,
    );
  }

  Widget buildSignUpButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUpPage(),
          ),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don\'t have an account?",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: "Sign up here",
              style: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splashimg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(24),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 170),
                      const SizedBox(height: 50),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 600),
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            buildUsername(),
                            const SizedBox(height: 25),
                            buildPassword(),
                            const SizedBox(height: 50),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigoAccent,
                                  padding: const EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  // Simulate login process
                                  String email = _emailController.text;
                                  String password = _passwordController.text;
                                  if (email == 'jsap@gmail.com' &&
                                      password == 'allu') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Login Successful!'),
                                      ),
                                    );
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserTypeSelectionPage(),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Login Unsuccessful!'),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 25),
                            buildSignUpButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
