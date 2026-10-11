import 'package:flutter/material.dart';

class PhaseButton extends StatelessWidget {
  const PhaseButton({
    super.key,
    required this.title,
    required this.icon,
    required this.destination,
  });

  final String title;
  final IconData icon;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
      },
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
