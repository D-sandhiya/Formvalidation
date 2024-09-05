import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validationpage/GlobalComponents/GlobalAppImage.dart';
import 'package:validationpage/GlobalComponents/GlobalColors.dart';
import 'package:validationpage/welcomescreen.dart';

class Formscreen extends StatefulWidget {
  @override
  State<Formscreen> createState() => _FormscreenState();
}

class _FormscreenState extends State<Formscreen> {
  final _formfield = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  GlobalAppImage.SplashImage,
                  height: 150,
                  width: 400,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter  name';
                          }
                          return null;
                        }),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_^{}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);

                        if (value.isEmpty) {
                          return "Enter email";
                        } else if (!emailValid) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passController,
                      obscureText: _passToggle,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: const OutlineInputBorder(),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _passToggle = !_passToggle;
                            });
                          },
                          child: Icon(
                            _passToggle
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter password";
                        } else if (_passController.text.length < 6) {
                          return "Password length should be more than 6 characters";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      print(
                          "Navigating to WelcomeScreen with name: ${_nameController.text} and email: ${_emailController.text}");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(
                            email: _emailController.text.toString(),
                            name: _nameController.text.toString(),
                          ),
                        ),
                      );

                      //emailController.clear();
                      _passController.clear();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: GlobalAppColor.ButtonColorCode,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: GlobalAppColor.WhiteColorCode,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " password?",
                      style: TextStyle(
                        fontSize: 16,
                        color: GlobalAppColor.BlackColorCode,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
