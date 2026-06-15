import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.title,
    this.actions,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showAppBar = true,
    this.centerTitle = false,
    this.leading,
  });

  final String? title;
  final List<Widget>? actions;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showAppBar;
  final bool centerTitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar && title != null
          ? AppBar(
              title: Text(title!),
              centerTitle: centerTitle,
              actions: actions,
              leading: leading,
            )
          : null,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
