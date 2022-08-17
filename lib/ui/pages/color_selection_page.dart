import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/color_utils.dart';
import '../widgets/color_palette.dart';

class ColorSelectionPage extends StatelessWidget {
  const ColorSelectionPage({Key? key}) : super(key: key);

  void showDialog() {
    Get.dialog(const AlertDialog(
      title: Text('Flutter'),
      content: Text('Dialog'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color palette'),
          actions: [
            IconButton(onPressed: showDialog, icon: Icon(Icons.info_outline))
          ],
        ),
        // https://colorhunt.co/
        body: SingleChildScrollView(
            child: Column(children: [
          ColorPalette(
              callback: showColor,
              baseColor1: 'FFB3B3',
              baseColor2: 'FFDBA4',
              baseColor3: 'FFE9AE',
              baseColor4: 'C1EFFF'),
          ColorPalette(
              callback: showColor,
              baseColor1: 'F0EABE',
              baseColor2: '21E1E1',
              baseColor3: '3B9AE1',
              baseColor4: '3120E0'),
          ColorPalette(
              callback: showColor,
              baseColor1: 'FFF9CA',
              baseColor2: 'FFDEB4',
              baseColor3: 'FFB4B4',
              baseColor4: 'B2A4FF'),
          ColorPalette(
              callback: showColor,
              baseColor1: 'F8F9D7',
              baseColor2: 'C4D7E0',
              baseColor3: 'B2C8DF',
              baseColor4: '6E85B7')
        ])));
  }

  // está es la función que será llamada con cada click a un ColorPalette
  void showColor(String value) {
    Clipboard.setData(ClipboardData(text: value));
    Get.snackbar(
      'Color palette',
      'Valor copiado',
      backgroundColor: ColorUtils.FromHex(value),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
