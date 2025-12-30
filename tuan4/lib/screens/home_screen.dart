import 'package:flutter/material.dart';
import 'package:tuan4/screens/password_field_screen.dart';
import 'text_detail_screen.dart';
import 'image_screen.dart';
import 'textfield_screen.dart';
import 'row_layout_screen.dart';
import 'column_layout_screen.dart';
import 'box_layout_screen.dart';
import 'button_screen.dart';
import 'container_screen.dart';
import 'checkbox_screen.dart';
import 'padding_screen.dart';
import 'form_screen.dart';
import 'icon_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildItem(
      BuildContext context, String title, String subtitle, Widget screen) {
    return Card(
      color: Colors.blue.shade100,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => screen));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UI Components List")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const Text("Display",//DISPLAY
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            buildItem(context, "Text", "Displays text",
                const TextDetailScreen()),
            buildItem(
                context, "Image", "Displays an image", const ImageScreen()),
            buildItem(context,"Icon","Display icon", const IconScreen()),

            const SizedBox(height: 12),
            const Text("Input",//INPUT
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            buildItem(context, "TextField", "Input field for text",
                const TextFieldScreen()),
            buildItem( context, "PasswordField","Input field for passwords",
                const PasswordFieldScreen()),
            buildItem(context, "Button", "Button click",const ButtonScreen()),
            buildItem(context,"Checkbox","Checkbox input", const CheckboxScreen()),
            buildItem(context,"Form","Form", const FormScreen()),
            const SizedBox(height: 12),

            const Text("Layout",//LAYOUT
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            buildItem(context, "Row", "Arranges elements horizontally",
                const RowLayoutScreen()),
            buildItem(context, "Column","Arranges elements vertically",
                const ColumnLayoutScreen()),
            buildItem(context, "Box" ,"Arranges elements box",const BoxLayoutScreen()),
            buildItem(context,"Container","a fundamental user interface element used to organize, position, and style other widgets within an application's layout",const ContainerScreen()),
            buildItem(context,"Padding","to control the layout of its child by insetting it by a specified amount on one or more sides", const PaddingScreen()),
            const SizedBox(height: 20),
            ElevatedButton(
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.red.shade300),
              onPressed: () {},
              child: const Text("Tự tìm hiểu\nTìm ra tất cả các thành phần UI cơ bản",
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}


