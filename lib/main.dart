
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ActionSheetApp());

class ActionSheetApp extends StatelessWidget {
  const ActionSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: ActionSheetExample(),
    );
  }
}

class ActionSheetExample extends StatefulWidget {
  const ActionSheetExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ActionSheetExampleState createState() => _ActionSheetExampleState();
}

class _ActionSheetExampleState extends State<ActionSheetExample> {
  int ilkSay = 0;
  int ikinciSay = 0;
  var sonuc = 0;

  void hesapla(islem) {
    setState(() {
      if (islem == "topla") {
        sonuc = (ilkSay + ikinciSay);
      } else if (islem == "çıkart") {
        sonuc = (ilkSay - ikinciSay);
      } else if (islem == "çarp") {
        sonuc = (ilkSay * ikinciSay);
      } else if (islem == "böl") {
        if (ikinciSay != 0) {
          sonuc = ilkSay ~/ ikinciSay;
        } else {
          sonuc = "Bölenin sıfır olma durumu tanımsızdır!" as int;
        }
      }
    });
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Seçim Yapın'),
        message: const Text(
            'Lütfen ilgili sayılarla yapmak istediğiniz işlemi seçin.'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              hesapla("topla");
              Navigator.pop(context);
            },
            child: const Text('Topla'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              hesapla("çıkart");
              Navigator.pop(context);
            },
            child: const Text('Çıkart'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              hesapla("çarp");
              Navigator.pop(context);
            },
            child: const Text('Çarp'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              hesapla("böl");
              Navigator.pop(context);
            },
            child: const Text('Böl'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Basit Hesap Makinesi'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              placeholder: "İlk sayıyı girin",
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ilkSay = int.tryParse(value) ?? 0;
              },
            ),
            CupertinoTextField(
              placeholder: "İkinci sayıyı girin",
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ikinciSay = int.tryParse(value) ?? 0;
              },
            ),
            CupertinoButton(
              onPressed: () => _showActionSheet(context),
              child: const Text('Hesapla'),
            ),
            CupertinoTextField(
              placeholder: "Sonuç",
              textAlign: TextAlign.center,
              readOnly: true,
              controller: TextEditingController(text: sonuc.toString()),
              style: const TextStyle(fontSize: 25.0 , color: Colors.blueAccent),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
