import 'package:flutter/material.dart';

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
      ],
    );
  }
}
