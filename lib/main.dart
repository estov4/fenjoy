import 'package:fenjoy/firebase_option.dart';
import 'package:fenjoy/user/category.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'auth/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fenjoy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Fenjoy',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFFFD101)),
        child: Stack(
          children: [
            Positioned(
              left: screenWidth * 0.418,
              top: screenHeight * 0.742,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 179, 3),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.446,
              top: screenHeight * 0.794,
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '  ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.374,
              top: screenHeight * 0.042,
              child: const Text(
                'Fenjoy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'CherryBomb',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.465,
              top: screenHeight * 0.272,
              child: const Text(
                'Good',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontFamily: 'JustAnotherHand',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.467,
              top: screenHeight * 0.401,
              child: const SizedBox(
                width: 76,
                height: 64,
                child: Text(
                  'Good',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontFamily: 'JustAnotherHand',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.260,
              top: screenHeight * 0.281,
              child: const SizedBox(
                width: 195,
                child: Text(
                  'Food',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 100,
                    fontFamily: 'Galada',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.395,
              top: screenHeight * 0.401,
              child: const Text(
                'is',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontFamily: 'Galada',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.207,
              top: screenHeight * 0.421,
              child: const Text(
                'Mood',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 100,
                  fontFamily: 'Galada',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.446,
              top: screenHeight * 0.794,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
