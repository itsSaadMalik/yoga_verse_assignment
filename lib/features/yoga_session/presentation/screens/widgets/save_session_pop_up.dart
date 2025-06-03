import 'package:flutter/material.dart';

class SaveSessionPopUp extends StatefulWidget {
  const SaveSessionPopUp({super.key});

  @override
  State<SaveSessionPopUp> createState() => _SaveSessionPopUpState();
}

class _SaveSessionPopUpState extends State<SaveSessionPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
      ],
      content: Text(
        'would you like to save this session ?',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.black, fontSize: 13.5),
      ),
      backgroundColor: Colors.white,
    );
  }
}
