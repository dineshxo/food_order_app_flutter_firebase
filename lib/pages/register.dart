import 'package:flutter/material.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/components/main_text_filed.dart';

class Register extends StatefulWidget {
  const Register({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open_outlined,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Let's create a account for you.",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                height: 10,
              ),
              MainTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              MainTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              MainTextField(
                  controller: passwordController,
                  hintText: "Confirm Password",
                  obscureText: true),
              const SizedBox(
                height: 20,
              ),
              MainButton(
                text: "Sign up",
                onTap: () {},
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a member?"),
                  TextButton(
                      onPressed: () {
                        widget.onTap!();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
