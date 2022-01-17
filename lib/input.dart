/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-07 10:57:08
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-07 14:22:33
 * @FilePath: /guan_f/lib/input.dart
 */
// import 'package:fis_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class FInput {
  static const double hintSize = 13.0;
  static const double contentSize = 14.0;
  static const Color txtColor = Colors.black87;

  /// 全边框装饰
  static InputDecoration borderDecoration({
    double height,
    String hintText,
    Color borderColor,
    Color fillColor,
    bool enabled = true,
  }) {
    final _height = height ?? 32;
    final paddingVertical =
        (_height - FInput.contentSize) / 2 - 1; // 预留了1给border
    final borderSide = BorderSide(
      color: borderColor ?? Colors.grey,
      width: 1,
    );
    final border = OutlineInputBorder(
      borderSide: borderSide,
      // borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintText != null
          ? TextStyle(color: Colors.grey, fontSize: FInput.hintSize)
          : null,
      filled: fillColor != null || enabled == false,
      fillColor: enabled == false ? Colors.grey[100] : fillColor,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: borderSide.copyWith(width: 1.5),
      ),
      disabledBorder: border.copyWith(
        borderSide: borderSide.copyWith(color: Colors.grey),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: paddingVertical,
      ),
      counterText: '', //不需要计数
      isDense: true,
    );
  }
}

class FBorderInput extends StatelessWidget {
  const FBorderInput({
    Key key,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.height,
    this.width,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.enabled,
    this.borderColor,
    this.fillColor,
    this.hintText,
    this.hintSize = FInput.hintSize,
    this.contentSize = FInput.contentSize,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool readOnly;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final ValueChanged onChanged;
  final bool enabled;
  final double height;
  final double width;
  final Color borderColor;
  final Color fillColor;
  final String hintText;
  final double hintSize;
  final double contentSize;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final _height = height ?? 32;
    final paddingVertical = (_height - contentSize) / 2 - 1; // 预留了1给border
    final borderSide = BorderSide(
      color: borderColor ?? Colors.grey,
      width: 1,
    );
    final border = OutlineInputBorder(
      borderSide: borderSide,
      // borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
    final decoration = InputDecoration(
      hintText: hintText,
      hintStyle: hintText != null
          ? TextStyle(color: Colors.grey, fontSize: hintSize)
          : null,
      filled: fillColor != null || enabled == false,
      fillColor: enabled == false ? Colors.grey[100] : fillColor,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: borderSide.copyWith(width: 1.5),
      ),
      disabledBorder: border.copyWith(
        borderSide: borderSide.copyWith(color: Colors.grey),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: paddingVertical,
      ),
      counterText: '', //不需要计数
      isDense: true,
    );
    final field = TextField(
      controller: controller,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: decoration,
      readOnly: readOnly,
      enabled: enabled,
      maxLength: maxLength,
      obscureText: isPassword,
      // obscuringCharacter: '*',
      style: TextStyle(color: FInput.txtColor, fontSize: contentSize),
    );
    // ignore: sized_box_for_whitespace
    return Expanded(
      child: Container(
        width: width,
        height: _height,
        child: field,
      ),
    );
  }
}

class FUnderlineInput extends StatelessWidget {
  const FUnderlineInput({
    Key key,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.height,
    this.width,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.enabled,
    this.underlineColor,
    this.fillColor,
    this.hintText,
    this.hintSize = FInput.hintSize,
    this.contentSize = FInput.contentSize,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool readOnly;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final ValueChanged onChanged;
  final bool enabled;
  final double height;
  final double width;
  final Color underlineColor;
  final Color fillColor;
  final String hintText;
  final double hintSize;
  final double contentSize;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final _height = height ?? 32;
    final paddingVertical = (_height - contentSize) / 2 - 1; // 预留了1给border
    final borderSide = BorderSide(
      color: underlineColor ?? Colors.grey,
      width: 1,
    );
    final border = UnderlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
    final decoration = InputDecoration(
      hintText: hintText,
      hintStyle: hintText != null
          ? TextStyle(color: Colors.grey, fontSize: hintSize)
          : null,
      filled: fillColor != null || enabled == false,
      fillColor: enabled == false ? Colors.grey[100] : fillColor,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: borderSide.copyWith(width: 1.5),
      ),
      disabledBorder: border.copyWith(
        borderSide: borderSide.copyWith(color: Colors.grey),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: paddingVertical,
      ),
      constraints: BoxConstraints(maxHeight: _height),
      counterText: '', //不需要计数
      isDense: true,
    );
    final field = TextField(
      controller: controller,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: decoration,
      readOnly: readOnly,
      enabled: enabled,
      maxLength: maxLength,
      obscureText: isPassword,
      // obscuringCharacter: '*',
      style: TextStyle(color: FInput.txtColor, fontSize: contentSize),
    );
    // ignore: sized_box_for_whitespace

    return Expanded(
      child: Container(
        width: width,
        height: _height,
        child: field,
      ),
    );
  }
}

/// 无边框输入框（focus后显示边框边界）
class FRimlessInput extends StatelessWidget {
  const FRimlessInput({
    Key key,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.height,
    this.width,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.enabled,
    this.borderColor,
    this.fillColor,
    this.hintText,
    this.hintSize = FInput.hintSize,
    this.contentSize = FInput.contentSize,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool readOnly;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final ValueChanged onChanged;
  final bool enabled;
  final double height;
  final double width;
  final Color borderColor;
  final Color fillColor;
  final String hintText;
  final double hintSize;
  final double contentSize;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final _height = height ?? 32;
    final paddingVertical = (_height - contentSize) / 2 - 1; // 预留了1给border
    final borderSide = BorderSide(
      color: borderColor ?? Colors.grey,
      width: 1,
    );
    final border = OutlineInputBorder(
      borderSide: borderSide,
      // borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
    final decoration = InputDecoration(
      hintText: hintText,
      hintStyle: hintText != null
          ? TextStyle(color: Colors.grey, fontSize: hintSize)
          : null,
      filled: fillColor != null || enabled == false,
      fillColor: enabled == false ? Colors.grey[100] : fillColor,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: border.copyWith(
        borderSide: borderSide.copyWith(width: 1.5),
      ),
      disabledBorder: border.copyWith(
        borderSide: borderSide.copyWith(color: Colors.grey),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: paddingVertical,
      ),
      counterText: '', //不需要计数
      isDense: true,
    );
    final field = TextField(
      controller: controller,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: decoration,
      readOnly: readOnly,
      enabled: enabled,
      maxLength: maxLength,
      obscureText: isPassword,
      // obscuringCharacter: '*',
      style: TextStyle(color: FInput.txtColor, fontSize: contentSize),
    );
    // ignore: sized_box_for_whitespace
    return Expanded(
      child: Container(
        width: width,
        height: _height,
        child: field,
      ),
    );
  }

  static InputDecoration buildDecoration({
    double height,
    String hintText,
    Color borderColor,
    Color fillColor,
    bool enabled = true,
    double contentSize = FInput.contentSize,
    double hintSize = FInput.hintSize,
  }) {
    final _height = height ?? 32;
    final paddingVertical = (_height - contentSize) / 2 - 1; // 预留了1给border
    final borderSide = BorderSide(
      color: borderColor ?? Colors.grey,
      width: 1,
    );
    final border = OutlineInputBorder(
      borderSide: borderSide,
      // borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
    final decoration = InputDecoration(
      hintText: hintText,
      hintStyle: hintText != null
          ? TextStyle(color: Colors.grey, fontSize: hintSize)
          : null,
      filled: fillColor != null || enabled == false,
      fillColor: enabled == false ? Colors.grey[100] : fillColor,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: border.copyWith(
        borderSide: borderSide.copyWith(width: 1.5),
      ),
      disabledBorder: border.copyWith(
        borderSide: borderSide.copyWith(color: Colors.grey),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: paddingVertical,
      ),
      counterText: '', //不需要计数
      isDense: true,
    );
    return decoration;
  }
}
