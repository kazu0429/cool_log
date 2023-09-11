import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Calendar",
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
                  "assets/images/undraw_Calendar_re_ki49.png",
                  width: 10,
                ),
              )),
        ),
      ],
    );
  }
}
