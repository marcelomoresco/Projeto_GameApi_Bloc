import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.focusNode,
    required this.textController,
    required this.label,
    required this.icons,
    required this.obscureText,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController textController;
  final String label;
  final Icon icons;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.00),
      child: TextFormField(
        obscureText: obscureText,
        controller: textController,
        autofocus: false,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(focusNode);
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(5.5)),
            hintStyle: const TextStyle(color: Colors.blue),
            filled: true,
            fillColor: Colors.transparent,
            hintText: label,
            prefixIcon: icons),
      ),
    );
  }
}
