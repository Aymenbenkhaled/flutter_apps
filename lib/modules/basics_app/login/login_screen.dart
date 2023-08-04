import 'package:flutter/material.dart';
import 'package:flutter_app_1/shared/components/components.dart';

import '../login_result/login_result_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKea = GlobalKey<FormState>();
  bool a = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKea,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    suffpressd: () {},
                    controller: emailController,
                    label: 'Email',
                    type: TextInputType.emailAddress,
                    prefIcon: Icons.email_rounded,
                    radius: 20,
                    //text: 'Email empty',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Email empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    obscureText: a,
                    //text: 'password must not be empty',
                    prefIcon: Icons.lock,
                    suffIcon: a ? Icons.visibility : Icons.visibility_off,
                    suffpressd: () {
                      setState(() {
                        a = !a;
                      });
                    },
                    radius: 20,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Password incorrect';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Center(
                    child: defaultBotton(
                      function: () {
                        if (formKea.currentState!.validate()) {
                          print(
                              '${emailController.text} // ${passwordController.text}'
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>LoginResultScreen(
                                    email: emailController.text,
                                    password: passwordController.text,
                                ),
                              )
                          );
                        }
                      },
                      text: 'login',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          print(
                              '${emailController.text} //// ${passwordController.text}');
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
