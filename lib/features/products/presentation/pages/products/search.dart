import 'package:ecommerce_system_design/foundation/app_colors.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final String hintText;
  final Function(String text)? onChange;
  final Widget? suffixIcon;
  final bool autoFocus;
  final double height;
  final TextEditingController? controller;
  final BoxDecoration? decoration;
  final Color? colorInputText;
  final void Function(bool focus)? onFocus;

  const Search({
    super.key,
    this.hintText = '',
    this.onChange,
    this.suffixIcon,
    this.autoFocus = false,
    this.height = 36,
    this.onFocus,
    this.controller,
    this.decoration,
    this.colorInputText,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool showSuffixIcon = false;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(_onTextController);
    }
    focusNode.addListener(() {
      widget.onFocus?.call(focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onTextController);
    super.dispose();
  }

  void _onTextController() {
    if (mounted) {
      setState(() {
        showSuffixIcon = widget.controller!.text.isNotEmpty;
      });
    }
  }

  _onChange(String text) {
    widget.onChange?.call(text);
    setState(() {
      showSuffixIcon = text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: widget.height,
        color: widget.decoration == null ? AppColors.secondaryColor : null,
        alignment: Alignment.centerRight,
        decoration: widget.decoration,
        child: TextField(
          controller: widget.controller,
          textCapitalization: TextCapitalization.words,
          autofocus: widget.autoFocus,
          focusNode: focusNode,
          onTapOutside:
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
          onChanged: (value) {
            _onChange(value);
          },
          style: TextStyle(color: widget.colorInputText ?? AppColors.textBody),
          decoration: inputDecoration(context),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: const TextStyle(color: Color(0xFF878D90)),
      // filled: true,
      border: InputBorder.none,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      prefixIconConstraints: const BoxConstraints.expand(width: 24, height: 14),
      prefixIcon: Container(
        padding: const EdgeInsets.only(left: 4),
        child: const Icon(Icons.search, size: 18, color: Color(0xFF878D90)),
      ),
      // suffixIcon: suffixIcon,
      suffixIcon:
          widget.suffixIcon ??
          (showSuffixIcon
              ? GestureDetector(
                onTap: () {
                  _onChange('');
                  widget.controller?.clear();
                },
                child: Center(
                  child: Icon(Icons.close, color: Color(0xFF878D90)),
                ),
              )
              : const SizedBox()),
      suffixIconConstraints: const BoxConstraints.expand(width: 30, height: 24),
      // fillColor: Scheme.colorScheme(context).searchColor,
      // focusColor: Colors.green,
      // hoverColor: Colors.cyan,
    );
  }
}
