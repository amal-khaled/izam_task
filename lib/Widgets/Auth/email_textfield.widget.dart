import 'package:flutter/material.dart';
import '../../Utilities/static_functions.dart';
import 'auth_textfield_widget.dart';

class EmailTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  EmailTextFieldWidget({
    Key? key,
    this.textFieldFocusNode,
    this.nextTextFieldFocusNode,
    this.initialValue,
    required this.returnValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthTextFieldWidget(
      textFieldFocusNode: textFieldFocusNode,
      type: TextInputType.emailAddress,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      initialValue: initialValue,
      hintText: "Email Address",
      returnValue: (value) => returnValue(value),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "enter your email";
          // StaticFunctions.showNotification(context, "enter your email");
          //           return null;

        } else if (!StaticFunctions.checkValidEmail(value)) {
         return "email shoould contain Alphapets.numbers@izam.co";
                        // return null;

        } else {
          return null;
        }
      },
    );
  }
}
