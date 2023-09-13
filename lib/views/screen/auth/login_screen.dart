import 'package:flutter/material.dart';
import 'package:uber_shop_app/views/screen/auth/register_screen.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({super.key});
  late String email;
  late String password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login Account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) => (email = value,),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Email Address Must Not Be Empty'";
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
                  labelText: "Email Address",
                  hintText: "Enter Email Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Password Must Not Be Empty";
                  }
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.pink,
                    ),
                    labelText: "Password",
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print(password);
                    print(email);
                    print("Validated");
                  }
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Need An Account?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
