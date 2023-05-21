import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final Widget child;
  final ValueNotifier isLoading;
  const LoadingWidget(
      {required this.child, required this.isLoading, super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.isLoading,
      builder: (context, value, _) {
        return Stack(
          children: [
            Positioned.fill(
              child: widget.child,
            ),
            if (value)
              Positioned.fill(
                child: Opacity(
                  opacity: value ? 0.2 : 0.0,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            if (value)
              Positioned.fill(
                child: Opacity(
                  opacity: value ? 1.0 : 0.0,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
