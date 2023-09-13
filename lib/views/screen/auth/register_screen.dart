import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_shop_app/controllers/auth_controllers.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController _authController = AuthController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late String fullName;
  late String password;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register Account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 20),
                const Stack(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      child: Icon(Icons.person, size: 70),
                    ),
                    Positioned(
                      right: 15,
                      bottom: 15,
                      child: Icon(CupertinoIcons.photo),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                //hinText serves as a placeholder in html
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Email Address Must Not Be Empty';
                    } else if (!isValidEmail(value)) {
                      return 'Please enter a valid email address';
                    } else {
                      return null;
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    fullName = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Full Name Must not Be Empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.pink,
                    ),
                    labelText: "Full Name",
                    hintText: "Enter Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Password Must not Be Empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.pink,
                      ),
                      labelText: "Password",
                      hintText: "Enter Full Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.createNewUser(email, fullName, password);
                      print("Success");
                    } else {
                      print('Not Valid');
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("Already Have An Account? "),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
