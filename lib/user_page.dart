import 'package:cook_log/login_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Profile",
                style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
              ),
              background: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  "assets/images/undraw_sweet_home_dkhr.png",
                  width: 10,
                ),
              )),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: TextButton(
              child: const Text("サインアウト"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                await Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
          ),
        )
      ],
    );
  }
}
