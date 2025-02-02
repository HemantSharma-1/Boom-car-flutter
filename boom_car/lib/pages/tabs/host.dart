import 'package:flutter/material.dart';

class Host extends StatefulWidget {
  const Host({super.key});

  @override
  State<Host> createState() => _HostState();
}

class _HostState extends State<Host> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Host"),
    );
  }
}