
import 'package:codexias_academy/const/color_const.dart';
import 'package:codexias_academy/const/string_const.dart';
import 'package:codexias_academy/ui/home_screen.dart';
import 'package:codexias_academy/ui/login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
                child: Center(
                    child: Column(
                      children: [
                        const Text(
                          StringConst.appName1,
                          style: TextStyle(
                              fontSize: 34,
                              color: ColorConst.signTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          StringConst.appName,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 26,
                          ),
                        )
                      ],
                    ))),
            const SizedBox(
              height: 38,
            ),
            TextField(
              cursorColor: ColorConst.textFieled,
              decoration: InputDecoration(
                  label: Text(
                    'Name',
                    style: TextStyle(color: ColorConst.textFieled),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: ColorConst.textFieled,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: ColorConst.textFieled,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              cursorColor: ColorConst.textFieled,
              decoration: InputDecoration(
                  label: Text(
                    'Email',
                    style: TextStyle(color: ColorConst.textFieled),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: ColorConst.textFieled,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: ColorConst.textFieled,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              cursorColor: ColorConst.textFieled,
              decoration: InputDecoration(
                  label: Text(
                    'Password',
                    style: TextStyle(color: ColorConst.textFieled),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: ColorConst.textFieled,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: ColorConst.textFieled,
                      ))),
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConst.buttonColor,
                ),
                child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(color: ColorConst.signTextColor),
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
