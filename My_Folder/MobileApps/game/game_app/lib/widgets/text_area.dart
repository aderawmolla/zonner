import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textarea extends StatefulWidget {
  Textarea(
      {super.key,
      required this.hint,
      required this.isValid,
      required this.isObscure,
      required this.isPassword,
      required this.icon,
      required this.onChanged,
      required this.controller,
      this.setObscure});
  late String hint;
  bool isValid;
  bool isObscure;
  bool isPassword;
  late IconData icon;
  final ValueChanged<String> onChanged;
  final VoidCallback? setObscure;
  final TextEditingController controller;

  @override
  State<Textarea> createState() => _TextareaState();
}

class _TextareaState extends State<Textarea> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: widget.isPassword && widget.isObscure,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    widget.isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    widget.setObscure!();
                  },
                )
              : const Icon(null),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.isValid ? Colors.grey : Colors.red,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.isValid ? Colors.grey : Colors.red,
              style: BorderStyle.solid,
            ),
          ),
          prefixIcon: Icon(widget.icon),
          hintText: widget.hint,
        ),
        controller: widget.controller,
        onChanged: (value) {
          print("the value is ${value}");
          // widget.onChanged(value);
        },
      ),
    );
  }
}
