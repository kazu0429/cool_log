import 'package:cook_log/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  String? _email = '';
  String? _password = '';

  String? _name = '';

  _alertDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Welcome to App！'),
              content: SizedBox(
                  height: 200,
                  child: Column(children: [
                    const Text(
                        '登録が完了しました！メールアドレスとパスワードは忘れないようにパスワードマネージャーなどを利用して保存しておきましょう。'),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text('アプリ内でのアイコンとユーザー名を決めてください'),
                    Row(
                      children: [
                        IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: const Icon(Icons.account_circle)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(hintText: "name"),
                            onSaved: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                            validator: (value) {
                              return value!.length >= 4
                                  ? null
                                  : "4文字以上の名前を使用してください";
                            },
                          ),
                        )
                      ],
                    ),
                  ])),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: const Text("Next!"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
      ),
      body: Center(
        child: Container(
            width: 300,
            height: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Form(
                key: _signUpFormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 200,
                        child: Image.asset(
                          'images/undraw_welcome_cats_thqn.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      _emailTextField(),
                      const SizedBox(
                        height: 10,
                      ),
                      _passwordTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _signUpButton(),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            _alertDialog();
                          },
                          child: const Text("ユーザー名")),
                      TextButton(
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text('login')),
                    ]))),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "email"),
      onSaved: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (value) {
        bool result = value!.contains(
          RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
        );
        return result ? null : "正い形式のemailを入力してください";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "password"),
      onSaved: (value) {
        setState(() {
          _password = value;
        });
      },
      validator: (value) {
        return value!.length >= 8 ? null : "8文字以上のパスワードにしてください";
      },
    );
  }

  Widget _signUpButton() {
    void _signUpUser() async {
      if (_signUpFormKey.currentState!.validate()) {
        _signUpFormKey.currentState!.save();
        try {
          final User? user = (await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _email as String, password: _password as String))
              .user;
          debugPrint("$_email, $_password");
          if (user != null) {
            debugPrint("ユーザ登録しました ${user.email}, ${user.uid}");
          }
          if (!mounted) return;
          _alertDialog();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            debugPrint('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            debugPrint('The account already exists for that email.');
          }
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(),
        ),
        onPressed: _signUpUser,
        child: const Text('Sign UP!'),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? _email = '';
  String? _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
          child: Container(
              width: 300,
              height: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 200,
                      child: Image.asset(
                        'images/undraw_Login_re_4vu2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    _emailTextField(),
                    const SizedBox(
                      height: 5,
                    ),
                    _passwordTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    _loginButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));
                        },
                        child: const Text('signup'))
                  ],
                ),
              ))),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "email"),
      onSaved: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (value) {
        bool result = value!.contains(
          RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
        );
        return result ? null : "正い形式のemailを入力してください";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "password"),
      onSaved: (value) {
        setState(() {
          _password = value;
        });
      },
      validator: (value) {
        return value!.length >= 8 ? null : "8文字以上のパスワードにしてください";
      },
    );
  }

  Widget _loginButton() {
    void _loginUser() async {
      if (_loginFormKey.currentState!.validate()) {
        _loginFormKey.currentState!.save();
        try {
          final User? user = (await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _email as String, password: _password as String))
              .user;
          if (user != null) {
            debugPrint("ログインしました ${user.email} , ${user.uid}");
          }
          if (!mounted) return;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(),
        ),
        onPressed: _loginUser,
        child: const Text('Login!'),
      ),
    );
  }
}
