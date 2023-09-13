import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  String _email = '';
  String _password = '';

  _alertDialog() {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Welcome to App！'),
              content: Text(
                  '登録が完了しました！メールアドレスとパスワードは忘れないようにパスワードマネージャーなどを利用して保存しておきましょう。'),
              actions: [
                // TextButton(
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => FirstPage()));
                //   },
                //   child: const Text("Next!"),
                // )
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 300,
              height: 200,
              child: Image.asset(
                'images/undraw_welcome_cats_thqn.png',
                fit: BoxFit.contain,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'email'),
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'password'),
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('新規作成'),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text('login')),
          ]),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
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
                                  builder: (context) => SignUpPage()));
                        },
                        child: const Text('signup'))
                  ],
                ),
              ))),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "email"),
      onSaved: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (value) {
        bool _result = value!.contains(
          RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
        );
        return _result ? null : "正い形式のemailを入力してください";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(hintText: "password"),
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
    void _loginUser() {
      if (_loginFormKey.currentState!.validate()) {
        _loginFormKey.currentState!.save();
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
