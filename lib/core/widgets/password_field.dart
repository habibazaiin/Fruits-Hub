import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(Icons.remove_red_eye, color: Color(0XFFC9CECF))
            : const Icon(Icons.visibility_off, color: Color(0XFFC9CECF)),
      ),
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'من فضلك ادخل كلمة المرور';
        }
        if (value.length < 6) {
          return 'كلمة المرور يجب ان تكون 6 احرف على الاقل';
        }
        return null;
      },
    );
  }
}
