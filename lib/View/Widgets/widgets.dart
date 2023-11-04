import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Widget for Vertical Space
Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

// Widget for Horizontal Space
Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

// Widget for Text fontWeight 600 and size 14
getCustomTextStyleW6S14({color}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
}

// Widget for Text fontWeight 600 and size 14
Widget getCustomTextW6S14({text, color, textAlign, maxLines}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        overflow: TextOverflow.ellipsis),
  );
}

// Widget for Text size 16
Widget getCustomTextS16({text, color, textAlign, maxLines}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle(
        color: color,
        fontSize: 16.sp,
        overflow: TextOverflow.ellipsis),
  );
}

// Widget for Text fontWeight 600 and size 16
Widget getCustomTextW6S16({
  text,
  color,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
    ),
  );
}

// Widget for Text fontWeight 600 and size 18
Widget getCustomTextW6S18({
  text,
  color,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
    ),
  );
}

// Widget for Text Form Field
Widget getCustomTextFormField(
    {controller,
    validator,
    hintText,
    suffixIcon,
    obscureText,
    keyboardType,
    prefixIcon,
    onTap,
    readOnly,
    suffixIconConstraintsWidth,
    onChanged}) {
  return TextFormField(
    keyboardType: keyboardType,
    obscureText: obscureText ?? false,
    cursorColor: Colors.black,
    controller: controller,
    validator: validator,
    onTap: onTap,
    onChanged: onChanged,
    readOnly: readOnly ?? false,
    style: getCustomTextStyleW6S14(
      color: Colors.black,
    ),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0.px),
          borderRadius: BorderRadius.circular(10.0.px)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0.px),
          borderRadius: BorderRadius.circular(10.0.px)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0.px)),
      contentPadding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 1.3.h),
      suffixIconConstraints: BoxConstraints.tightFor(
          width: suffixIconConstraintsWidth ?? 6.0.h, height: 2.5.h),
      suffixIcon: suffixIcon,
      prefixIconConstraints:
          BoxConstraints.tightFor(width: 7.0.h, height: 3.5.h),
      prefixIcon: prefixIcon,
      isCollapsed: true,
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: getCustomTextStyleW6S14(
        color: Colors.grey,
      ),
      enabled: true,
    ),
  );
}

// Widget for Button
Widget fillColorButton({color,text, loading = false}) {
  return Container(
    height: 4.5.h,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: color ?? Colors.deepPurple,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        border: Border.all(color:color?? Colors.deepPurple, width: 1.px)),
    child: loading
        ? SizedBox(
            height: 2.5.h,
            width: 2.5.h,
            child: const CircularProgressIndicator(
              strokeWidth: 2.5,
              color: Colors.white,
            ),
          )
        : getCustomTextW6S16(
            text: text,
            color: Colors.white,
          ),
  );
}
