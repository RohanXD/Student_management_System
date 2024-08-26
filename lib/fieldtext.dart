import 'package:flutter/material.dart';

class Fieldtext extends StatefulWidget {
  const Fieldtext(this.controller, this.label, {super.key});
  final TextEditingController controller;
  final String label;

  @override
  State<StatefulWidget> createState() {
    return _Fieldtextstate();
  }
}

class _Fieldtextstate extends State<Fieldtext> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 125, 255)),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 125, 255),
          ),
        ),
        prefixIcon: const Icon(
          Icons.person,
          color: Color.fromARGB(255, 0, 125, 255),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 56, 56, 56),
        labelText: widget.label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 125, 255),
      ),
    ));
  }
}
