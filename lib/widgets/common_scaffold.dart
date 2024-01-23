import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({super.key, this.onRefresh, required this.children});
  final Future<void> Function()? onRefresh;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
            onRefresh: onRefresh ?? () async {},
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: children,
            )),
      ),
    );
  }
}
