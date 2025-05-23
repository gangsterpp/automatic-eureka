import 'package:flutter/material.dart';

class ServiceButton extends StatefulWidget {
  final Widget? icon;
  final String? title;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool isSelected;

  const ServiceButton({super.key, this.icon, this.title, this.onTap, this.backgroundColor, this.isSelected = false});

  @override
  State createState() => _ServiceButtonState();
}

class _ServiceButtonState extends State<ServiceButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isExpanded = widget.isSelected;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ServiceButton oldWidget) {
    _isExpanded = widget.isSelected;

    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _toggleExpansion() {
    if (widget.isSelected) return;
    if (widget.onTap == null) return;
    widget.onTap!();
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, c) {
        return Center(
          child: GestureDetector(
            onTap: _toggleExpansion,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: _isExpanded ? BorderRadius.circular(100) : null,
                shape: !_isExpanded ? BoxShape.circle : BoxShape.rectangle,
                border: !_isExpanded ? null : Border.all(color: const Color(0xFFAA76FF)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.icon != null) widget.icon!,
                    if (widget.title != null) ...[
                      _isExpanded ? const SizedBox(width: 8) : const SizedBox.shrink(),
                      SizeTransition(
                        sizeFactor: _animation,
                        axis: Axis.horizontal,
                        axisAlignment: -1,
                        child: FadeTransition(
                          opacity: _animation,
                          child: Center(child: Text(widget.title!, style: const TextStyle(color: Colors.black))),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
