import 'package:flutter/material.dart';

class UploadPage extends StatelessWidget {
  UploadPage({super.key});

  String menu = '';
  String category = '';
  String url = '';
  String notes = '';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "upload",
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
                  "assets/images/undraw_Cooking_p7m1.png",
                  width: 10,
                ),
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Today's recipe!",
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const Text("あなたが料理したものを保存して、後から見直せるようにしましょう。！",
                        style: TextStyle(
                            color: Colors.grey,
                            height: 3,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                    const Text("Menu",
                        style: TextStyle(
                            height: 3,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      onChanged: (value) {
                        menu = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.indigo,
                            )),
                      ),
                    ),
                    const Text("Category",
                        style: TextStyle(
                            height: 3,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.indigo,
                            )),
                      ),
                    ),
                    const Text("URL",
                        style: TextStyle(
                            height: 3,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.indigo,
                            )),
                      ),
                    ),
                    const Text("Notes",
                        style: TextStyle(
                            height: 3,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.indigo,
                            )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(),
                        ),
                        onPressed: () {
                          print(menu);
                        },
                        child: const Text('Upload!'),
                      ),
                    )
                  ]),
            )
          ]),
        )
      ],
    );
  }
}
