import 'package:flutter/material.dart';

import '../../../Utilities/constants.dart';

class AuthTextFieldWidget extends StatefulWidget {
  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  Widget? suffix;
  Widget? postFix;

  String? hintText;
  final Function returnValue;
  final Function validator;
  String? imageIcon;
  bool isHidden;
  TextInputType type;
  int? minLines;
  int? maxLines;
  int? minLine;
  String? initialValue;
  bool? enabled;
  bool isPassword;
  Color? bgColor;

  // final ValueGetter<String> onPressedn;
  AuthTextFieldWidget(
      {Key? key,
      this.maxLines,
      this.minLines,
      this.textFieldFocusNode,
      this.nextTextFieldFocusNode,
      required this.returnValue,
      required this.validator,
      this.suffix,
      this.postFix,
      this.hintText,
      this.isHidden = false,
      this.type = TextInputType.text,
      this.imageIcon,
      this.initialValue,
      this.enabled = true,
      this.isPassword = false,
      this.bgColor})
      : super(key: key);
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  // Color borderColor = Constants.LIGHT_GREY;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SizedBox(
      // height: 50,
      child: TextFormField(
        keyboardType: widget.type,
        obscureText: widget.isHidden,
        initialValue: widget.initialValue ?? "",
        enabled: widget.enabled,
        maxLines: widget.minLines ?? 1,
        minLines: widget.maxLines ?? 1,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(widget.nextTextFieldFocusNode);
        },
        focusNode: widget.textFieldFocusNode,
        decoration: InputDecoration(
          filled: true,
          errorMaxLines: 3,

          fillColor: Constants.BACKGROUND_COLOR,
          hintText: widget.hintText ?? "",
          hintStyle: TextStyle(color: Constants.HIINT_COLOR),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          //   fillColor: widget.bgColor ?? Constants.BACKGROUND_COLOR,
        ),
        onSaved: (value) => widget.returnValue(value),
        validator: (value) => widget.validator(value),
      ),
    );
  }
}
