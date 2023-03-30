import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../home.dart';

class AddItemView extends GetView<HomeController> {
  const AddItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CommonTextField(
              controller: controller.nameTextCtrl,
              hintText: 'Name',
            ),
            CommonTextField(
              controller: controller.catTextCtrl,
              hintText: 'Category',
            ),
            CommonTextField(
              controller: controller.indTextCtrl,
              hintText: 'Ingredient',
            ),
            CommonTextField(
              controller: controller.priceTextCtrl,
              hintText: 'Price',
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              child: Obx(
                () => ListTile(
                  onTap: controller.pickImage,
                  visualDensity: VisualDensity.compact,
                  title: Text(
                    controller.imageFile.value.path.isEmpty
                        ? 'Image'
                        : controller.imageFile.value.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(Icons.image),
                ),
              ),
            ),
            Container(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: controller.addItem,
                child: Text('Save Item'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const CommonTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: controller,
        validator: validator,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2,
              color: Colors.grey.shade50,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2,
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
