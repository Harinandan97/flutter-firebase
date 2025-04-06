import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasenew/travel/screens/register%20page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebase_options.dart';
import 'Home.dart';
import 'admin.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emaill = TextEditingController();
  final TextEditingController passwordd = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  //  Define Admin
  final String adminEmail = "harinandan@gmail.com";
  final String adminPassword = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: const Center(child: Text("Sign In")),
      ),*/
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/log.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emaill,

                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  icon: const Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                validator: (email) {
                  if (email == null || email.isEmpty || !email.contains("@") || !email.contains(".")) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordd,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  icon: const Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    loginUser();
                  }
                },
                child: const Text("Sign In"),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const register());
                },
                child: const Text("Not a user? Register here"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    try {
      String email = emaill.text.trim();
      String password = passwordd.text.trim();


      if (email == adminEmail && password == adminPassword) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Admin Login Successful")));
        Get.offAll(() =>  AdminPage());
        return;
      }


      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const home());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login error: ${e.toString()}")));
    }
  }
}
