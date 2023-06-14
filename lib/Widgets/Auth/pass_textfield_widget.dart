
import 'package:flutter/cupertino.dart';

import '../../Utilities/static_functions.dart';
import 'auth_textfield_widget.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  bool? enabled;

  PasswordTextFieldWidget({
    Key? key,
    this.textFieldFocusNode,
    this.nextTextFieldFocusNode,
    this.initialValue,
    required this.returnValue,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthTextFieldWidget(
      isPassword: true,
      isHidden: true,
      textFieldFocusNode: textFieldFocusNode,
      hintText: "Password",
      returnValue: (value) => returnValue(value),
      validator: (value) {
        if (value == null) {
                    // StaticFunctions.showNotification(context, "enter your password");

          return "enter your password";
                    // return null;

        } else if (!StaticFunctions.checkValidPassword(value)) {
                              // StaticFunctions.showNotification(context, "password should be 8 digits with at least 1 number and 1 special character (!\$#^*)");
          // return null;

          return "password should be 8 digits with at least 1 number and 1 special character (!\$#^*)";
        } else {
          return null;
        }
      },
    );
  }
}
