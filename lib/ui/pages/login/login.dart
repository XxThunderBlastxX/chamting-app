import 'package:chamting_app/utils/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double space = 0.03;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width * 0.47,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: size.height * space),
                      CustomTextField(
                        controller: emailController,
                        maxLines: 1,
                        hint: "email",
                        suffix: const Icon(Icons.email),
                        obscure: false,
                      ),
                      SizedBox(height: size.height * space),
                      CustomTextField(
                        controller: passwordController,
                        maxLines: 1,
                        hint: "password",
                        suffix: const Icon(Icons.password),
                        obscure: true,
                      ),
                      SizedBox(height: size.height * space),
                      SizedBox(
                        height: 100,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'forgot password?',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const CustomButton(title: 'Sign in'),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * space),
                      SizedBox(
                        height: 120,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'got an account? register with',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const CircularButton(
                                image: 'assets/images/google_icon.png'),
                            const CircularButton(
                                image: 'assets/images/google_icon.png'),
                            const CircularButton(
                                image: 'assets/images/google_icon.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height,
                  width: size.width * 0.47,
                  child: Image.asset(
                    'assets/images/LOGIN.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
