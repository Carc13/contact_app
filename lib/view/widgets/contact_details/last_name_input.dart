import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class LastNameInput extends StatefulWidget {

  final TextEditingController controller;

  final FocusNode focusNode;

  final Function(String)? onFieldSubmitted;

  const LastNameInput({ 
    Key? key, 
    required this.controller, 
    required this.focusNode,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<LastNameInput> createState() => _LastNameInputState();
}

class _LastNameInputState extends State<LastNameInput> {

  late bool _hasError;

  @override
  void initState() { 
    super.initState();
    _hasError = false;
  }

  InputBorder boderInput() {
    return OutlineInputBorder (
      borderRadius: BorderRadius.circular(16),
      gapPadding: 0,
      borderSide: const BorderSide(
        color: CustomColors.accentColor,
        width: 0.5,
      )
    );
  }

  InputBorder boderInputError() {
    return OutlineInputBorder (
      borderRadius: BorderRadius.circular(16),
      gapPadding: 0,
      borderSide: BorderSide(
        color: Colors.red.shade400,
        width: 0.5,
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: _hasError? 90 : 70,
      alignment: Alignment.center,
      child: TextFormField(
        maxLines: 1,
        controller: widget.controller,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        style: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
        cursorColor: CustomColors.accentColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: "Apellido",
          alignLabelWithHint: true,
          labelStyle: const TextStyle(
            color: CustomColors.highlightColor,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          errorMaxLines: 2,
          errorStyle: TextStyle(
            color: Colors.red.shade400,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          contentPadding: const EdgeInsets.only(top: 19,bottom: 19, left: 24,right: 24),
          enabledBorder: boderInput(),
          focusedBorder: boderInput(),
          focusedErrorBorder: boderInputError(),
          errorBorder: boderInputError(),
        ),
        validator: (String? value) {

          if(value == null || value.trim().isEmpty) {

            setState(() {
              _hasError = true;
            });

            return "No puedes dejarlo vacio.";
 
          } 

          if(_hasError) {

            setState(() {
              _hasError = false;  
            });

          }

          return null;

        },
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );

  }

}