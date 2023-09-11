import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  UploadPage({super.key});
  @override
  State<UploadPage> createState() => _UploadState();
}

class _UploadState extends State<UploadPage> {
  final GlobalKey<FormState> _uploadFormKey = GlobalKey<FormState>();

  String? menu;
  String? category;
  String? url;
  String? notes;

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
            Form(
              key: _uploadFormKey,
              child: Padding(
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
                      TextFormField(
                        onSaved: (value) {
                          setState(() {
                            menu = value;
                          });
                        },
                        validator: (value) {
                          return value != "" ? null : "メニュー名を入力してください";
                        },
                        decoration: InputDecoration(
                          hintText: '煮込みハンバーグ',
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
                      TextFormField(
                        onSaved: (value) {
                          setState(() {
                            category = value;
                          });
                        },
                        validator: (value) {
                          return value != "" ? null : "カテゴリーを入力してください";
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
                      const Text("URL",
                          style: TextStyle(
                              height: 3,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      TextFormField(
                        onSaved: (value) {
                          setState(() {
                            url = value;
                          });
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
                      const Text("Notes",
                          style: TextStyle(
                              height: 3,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      TextFormField(
                        onSaved: (value) {
                          setState(() {
                            notes = value;
                          });
                        },
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
                      _uploadButton()
                    ]),
              ),
            )
          ]),
        )
      ],
    );
  }

  Widget _uploadButton() {
    void _uploadRecipe() {
      if (_uploadFormKey.currentState!.validate()) {
        _uploadFormKey.currentState!.save();
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
        onPressed: _uploadRecipe,
        child: const Text('Upload!'),
      ),
    );
  }
}
