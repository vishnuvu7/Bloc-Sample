import 'package:bloc_sample/utils/common_utils/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class CommonTextField extends StatefulWidget {
  BuildContext context;
  TextEditingController controller;
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextStyle? textStyle;
  void Function()? onTap;
  void Function(String?)? onSaved;
  void Function(String)? onChanged;
  bool? readOnly = false;
  bool? autoFocus;
  bool? obscureText = false;
  AutovalidateMode? autoValidateMode;
  FocusNode? focusNode;
  TextInputType? textInputType;
  String? Function(String?)? validator;
  int? maxLength;
  int? maxLines = 1;
  int? minLines;
  TextInputAction? textInputAction;
  bool? filled = true;
  bool isBorder;
  bool isEnabled;
  Color? fillColor;
  List<TextInputFormatter>? inputFormatter;
  CommonTextField({
    Key? key,
    required this.context,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.textStyle,
    this.onTap,
    this.readOnly,
    this.autoValidateMode,
    this.focusNode,
    this.autoFocus,
    this.textInputType,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.obscureText,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.filled,
    this.isBorder = true,
    this.isEnabled = true,
    this.fillColor,
    this.inputFormatter
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: widget.isEnabled,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        autovalidateMode: widget.autoValidateMode,
        textInputAction: widget.textInputAction,
        obscureText: widget.obscureText ?? false,
        onTap: widget.onTap,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        focusNode: widget.focusNode,
        autofocus: widget.autoFocus ?? false,
        readOnly: widget.readOnly ?? false,
        inputFormatters: widget.inputFormatter,
        //TODO: Change decoration
        decoration: InputDecoration(
          labelText: widget.hintText.tr(),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          filled: widget.filled,
          fillColor: widget.fillColor,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          //hintText: widget.hintText.tr,
          hintStyle: widget.isEnabled ? widget.textStyle :  TextStyle(
            // body1 -> body2
            fontFamily: AppStyle.fontName,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.2,
            color: AppColors.grey,
          ),
          enabledBorder: widget.isEnabled == false ?  UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black),
            //  when the TextFormField in unfocused
          ) : null,
          border: widget.isBorder ? OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red,),
            borderRadius: BorderRadius.circular(100),
          ): null,
        ));
  }
}
