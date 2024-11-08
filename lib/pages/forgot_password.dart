import 'package:flutter/material.dart';
import 'package:thuchanh/pages/login_screen.dart';



class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/back.png",
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9A826).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9A826).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password new",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF9A826).withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "confirm Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
            ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9A826),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "confirm",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                
              ),
              const SizedBox(height: 30),
              
            ],
          ),
        ),
      ),
    );
  }
}
