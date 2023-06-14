

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utilities/constants.dart';

class ButtonWidget extends StatelessWidget {
  var title = "";
  String? image;
  double height;
  double? width;
  double borderRadius;
  final Function action;
  Color? color;
  Color? textColor;

  ButtonWidget(
      {Key? key,
      required this.title,
      this.height = 50,
      required this.action,
      this.width,
      this.borderRadius = 4,
      this.color,
      this.textColor,
      this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: () => {action()},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Constants.MAIN_COLOR,
          side: BorderSide(
            width: 1,
            color: color ?? Constants.MAIN_COLOR,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null)
              Center(
                child: Image.asset(
                  image ?? "",
                  height: 20,
                  width: 20,
                ),
              ),
            if (image != null && title != "")
              SizedBox(
                width: 10,
              ),
               if ( title != "")
            Text(
              title,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
