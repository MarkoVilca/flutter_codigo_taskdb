import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyformWidget extends StatefulWidget {
  const  MyformWidget({Key? key}) : super(key: key);

  @override
  State<MyformWidget> createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyformWidget>{

  bool isFinished = false;
  final TextEditingController _titleControler = TextEditingController();
  final TextEditingController _descriptionControler = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return AlertDialog(
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            Text("Agregar tarea"),
            const SizedBox(
              height: 6.0,
            ),
            TextField(
              controller: _titleControler,
              decoration: InputDecoration(hintText: "Titulo"),
            ),
            const SizedBox(
              height: 6.0,
            ),
            TextField(
              controller: _descriptionControler,
              maxLines: 2,
              decoration: InputDecoration(hintText: "Descripcion"),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              children: [
                const Text("Estado: "),
                const SizedBox(
                  width: 6.0,
                ),
                Checkbox(
                  value: isFinished, 
                  onChanged: (value) {
                    isFinished = value!;
                    setState((){});
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Aceptar",
                  ),
                ),
              ],
            )
          ]),
        );
  }
}