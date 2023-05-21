import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final IconData leadingIcon;
  final String text;
  final VoidCallback function;
  const SettingButton({
    super.key,
    required this.leadingIcon,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 52,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            onPressed: function,
            child: Row(
              children: [
                const SizedBox(width: 5),
                Icon(leadingIcon),
                const SizedBox(width: 13),
                Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
                const SizedBox(width: 5)
              ],
            )),
      ),
    );
  }
}
