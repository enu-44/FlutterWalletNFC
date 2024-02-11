import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.text, this.onTap, this.padding, this.icon})
      : super(key: key);
  final String text;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 60.0,
        child: ElevatedButton(
          onPressed: onTap,
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 20,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(flex: 1, child: Icon(icon)),
                  ],
                )
              : Text(text),
        ),
      ),
    );
  }
}
