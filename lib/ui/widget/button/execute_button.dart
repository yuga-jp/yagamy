import 'package:flutter/material.dart';

import 'package:yagamy/ui/theme/custom_color.dart';

class ExecuteButton extends StatefulWidget {
  const ExecuteButton({
    Key? key,
    required this.title,
    required this.isActivated,
    required this.onTap,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String title;
  final bool isActivated;
  final void Function() onTap;
  final Color textColor;

  @override
  State<ExecuteButton> createState() => _ExecuteButtonState();
}

class _ExecuteButtonState extends State<ExecuteButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isActivated
        ? _Activated(widget.title, widget.onTap)
        : const _Deactivated();
  }
}

class _Activated extends StatelessWidget {
  const _Activated(this.title, this.onTap);

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: CustomColor.executeButtonGradient,
          ),
        ),
        width: 300,
        height: 50,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(title,
                style: const TextStyle(
                    color: CustomColor.textColorOnExecuteButton, fontSize: 24)),
          ),
        ),
      ),
    );
  }
}

class _Deactivated extends StatelessWidget {
  const _Deactivated();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).disabledColor),
        width: 300,
        height: 50,
        child: const Center(
          child: Text('Not Ready.',
              style: TextStyle(
                  color: CustomColor.textColorOnExecuteButton, fontSize: 24)),
        ),
      ),
    );
  }
}
