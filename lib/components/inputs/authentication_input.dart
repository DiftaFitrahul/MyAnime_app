import 'package:flutter/material.dart';

class AuthenticationInput extends StatefulWidget {
  final TextEditingController inputController;
  final IconData inputIcon;
  final String hintText;
  final bool obsecured;
  const AuthenticationInput({
    super.key,
    required this.inputController,
    required this.inputIcon,
    required this.hintText,
    this.obsecured = false,
  });

  @override
  State<AuthenticationInput> createState() => _AuthenticationInputState();
}

class _AuthenticationInputState extends State<AuthenticationInput> {
  // final TextEditingController inputController;
  final inputController = TextEditingController();
  final _focusnode = FocusNode();
  Color _colorContainer = Colors.transparent;

  @override
  void initState() {
    _focusnode.addListener(() {
      setState(() {
        _colorContainer = _focusnode.hasFocus
            ? Colors.white.withOpacity(0.15)
            : Colors.transparent;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: Container(
        padding: const EdgeInsets.only(
          top: 15,
          left: 5,
        ),
        decoration: BoxDecoration(
            color: _colorContainer, borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          focusNode: _focusnode,
          controller: widget.inputController,
          obscureText: widget.obsecured,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 5),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              labelText: widget.hintText,
              labelStyle: const TextStyle(color: Colors.white70, fontSize: 11),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              prefixIcon: Icon(
                widget.inputIcon,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
