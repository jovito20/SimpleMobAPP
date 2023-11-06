import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

String masterusername = "1101204149";
String masterpassword = "1101204149";
String masteremail = "default";
String masternim = "default";
String masternumber = "-";

//Disclaimer app ini hanya bisa menampung 1 user saja, jika signup dilakukan maka data user sebelumnya akan terhapus, sesuai dengan arahan
//pada saat uts bahwa hanya 1 user saja yang diperlukan
//SPLASH SCREEN 1101204149
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 108, 95, 91),
      child: Image.asset("lib/assets/vito.jpg"),
      height: 100,
      width: 50,
    );
  }
}

//LOGIN PAGE 1101204149

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = '';

  void _login() {
    String testusername = usernameController.text;
    String testpassword = passwordController.text;
    String username = masterusername;
    String password = masterpassword;
    // Simple username and password check
    if (testusername == username && testpassword == password) {
      setState(() {
        message = 'Login successful!';
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      });
    } else {
      setState(() {
        message = 'Login failed. Please check your credentials.';
      });
    }
  }

  void _navigateToSignUp() {
    // Add navigation logic to your forgot password page
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignupPage(),
        ));
  }

  void _navigateToForgotPassword() {
    // Add navigation logic to your forgot password page
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotPasswordPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 108, 95, 91),
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: const Color.fromARGB(255, 237, 125, 49),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w900),
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              TextField(
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w900),
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 249, 241, 238)),
                onPressed: _login,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 249, 241, 238)),
                onPressed: _navigateToForgotPassword,
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Don\'t have an account?'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 249, 241, 238)),
                    onPressed: _navigateToSignUp,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Text(message)
            ],
          ),
        ),
      ),
    );
  }
}

//SIGNUP
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 108, 95, 91),
      appBar: AppBar(
        title: Text("Sign Up Page"),
        backgroundColor: const Color.fromARGB(255, 237, 125, 49),
      ),
      body: Center(
        child: SignupForm(),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController reasureController = TextEditingController();
  String pesan = '';
  void _signup() {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String nim = nimController.text;
    String reasure = reasureController.text;

    // You can add your signup logic here, such as creating a new user account.
    // For this example, we'll simply print the user's information to the console.

    if (password == reasure) {
      masterpassword = password;
      masterusername = username;
      masteremail = email;
      masternim = nim;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sign Up"),
            content: Text("Berhasil"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sign Up"),
            content: Text("Password tidak match."),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: nimController,
            decoration: InputDecoration(labelText: 'NIM'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: reasureController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Refill Password'),
          ),
        ),
        Text(pesan),
        SizedBox(
          height: 30,
          width: 120,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 249, 241, 238)),
              onPressed: _signup,
              child:
                  const Text("SIGN UP", style: TextStyle(color: Colors.black))),
        ),
      ],
    );
  }
}

//FORGOT PASSWORD
class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 108, 95, 91),
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: const Color.fromARGB(255, 237, 125, 49),
      ),
      body: Center(
        child: ForgotPasswordForm(),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reasureController = TextEditingController();
  String pesan = "HAVE A NICE DAY";
  void _resetPassword() {
    String username = usernameController.text;
    String password = passwordController.text;
    String reasure = reasureController.text;

    if (masterusername == username) {
      if (password == reasure) {
        masterpassword = password;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Password Reset"),
              content: Text("Berhasil mereset password dari $username."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Password Reset"),
              content: Text("Password tidak match."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Password Reset"),
            content: Text("Username '$username' tidak ditemukan."),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: reasureController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Refill Password'),
          ),
        ),
        Text(pesan),
        SizedBox(
          height: 30,
          width: 120,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 249, 241, 238)),
              onPressed: _resetPassword,
              child:
                  const Text("Reset", style: TextStyle(color: Colors.black))),
        ),
      ],
    );
  }
}

//HOMEPAGE
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 108, 95, 91),
      // drawer: NavBar(),
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: const Color.fromARGB(255, 237, 125, 49),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/vito.jpg',
                fit: BoxFit.fitWidth,
                height: 240,
              ),
              Text(
                'Welcome $masterusername',
                style: TextStyle(
                    // fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Color.fromARGB(255, 238, 235, 244),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Student of Telkom University',
                style: TextStyle(
                    // fontFamily: 'Source Sans',
                    color: Color.fromARGB(255, 238, 235, 244),
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 300.0,
                child: Divider(
                  color: Color.fromARGB(255, 238, 235, 244),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.perm_identity,
                    color: Color(0xFF3F1651),
                  ),
                  title: Text('$masternim',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF3F1651),
                        // fontFamily: 'Source Sans',
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color(0xFF3F1651),
                  ),
                  title: Text('$masteremail',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF3F1651),
                        // fontFamily: 'Source Sans',
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                color: Color.fromARGB(255, 255, 0, 0),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Text(
                  masternumber,
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              // SizedBox(
              //   height: 75,
              //   width: 75,
              //   child: Container(
              //     color: Color.fromARGB(255, 255, 0, 0),
              //     child: Text(masternumber),
              //     height: 100,
              //     width: 50,
              //   ),
              // ),
              // ),
              SizedBox(
                height: 75,
              ),
              SizedBox(
                height: 30,
                width: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 249, 241, 238)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Kalkulator1101204149(),
                        )),
                    child: const Text("KALKULATOR",
                        style: TextStyle(color: Colors.black))),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//KALKULATOR
class Kalkulator1101204149 extends StatefulWidget {
  const Kalkulator1101204149({super.key});

  @override
  State<Kalkulator1101204149> createState() => _Kalkulator1101204149State();
}

class _Kalkulator1101204149State extends State<Kalkulator1101204149> {
  String out = '';
  double num1 = 0;
  double num2 = 0;
  String outangka = '0';

  button(String x) {
    setState(() {
      if (x == '7') {
        outangka = '7';
        masternumber = outangka;
      } else if (x == '8') {
        outangka = '8';
        masternumber = outangka;
      } else if (x == '9') {
        outangka = '9';
        masternumber = outangka;
      } else if (x == '4') {
        outangka = '4';
        masternumber = outangka;
      } else if (x == '5') {
        outangka = '5';
        masternumber = outangka;
      } else if (x == '6') {
        outangka = '6';
        masternumber = outangka;
      } else if (x == '1') {
        outangka = '1';
        masternumber = outangka;
      } else if (x == '2') {
        outangka = '2';
        masternumber = outangka;
      } else if (x == '3') {
        outangka = '3';
        masternumber = outangka;
      } else if (x == '0') {
        outangka = '0';
        masternumber = outangka;
      } else if (x == 'C') {
        outangka = '0';
        masternumber = outangka;
      } else if (x == 'X') {
        out = x;
        num1 = double.parse(outangka);
        masternumber = outangka;
      } else if (x == '-') {
        // out = '0';
        out = x;
        num1 = double.parse(outangka);
        masternumber = outangka;
      } else if (x == '+') {
        out = x;
        num1 = double.parse(outangka);
      } else if (x == '/') {
        out = x;
        num1 = double.parse(outangka);
      } else if (x == '=') {
        num2 = double.parse(outangka);
        if (out == '+') {
          outangka = (num1 + num2).toString();
          masternumber = outangka;
        } else if (out == '-') {
          outangka = (num1 - num2).toString();
          masternumber = outangka;
        } else if (out == 'X') {
          outangka = (num1 * num2).toString();
          masternumber = outangka;
        } else if (out == '/') {
          outangka = (num1 / num2).toString();
          masternumber = outangka;
        }
      }
    });
  }

  Widget tombol(String x) {
    return SizedBox(
      width: 90,
      height: 90,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              shape: const CircleBorder()),
          onPressed: () => button(x),
          child: Text(x, style: const TextStyle(fontSize: 40))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 108, 95, 91),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 237, 125, 49),
          title: const Text("Kalkulator Simple"),
        ),
        body: Column(children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Text(
              outangka,
              style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tombol('7'),
                  tombol('8'),
                  tombol('9'),
                  tombol('X'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tombol('4'),
                  tombol('5'),
                  tombol('6'),
                  tombol('-'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tombol('1'),
                  tombol('2'),
                  tombol('3'),
                  tombol('+'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tombol('C'),
                  tombol('0'),
                  tombol('='),
                  tombol('/'),
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
            width: 120,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 249, 241, 238)),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    )),
                child:
                    const Text("BACK", style: TextStyle(color: Colors.black))),
          ),
          const SizedBox(
            height: 15,
            width: 250,
            child: Text(
              'Jonathan Vito 1101204149',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      );
    });
  }
}
