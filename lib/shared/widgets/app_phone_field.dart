import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AppPhoneField extends StatelessWidget {
  final String label;
  final String? initialCountryCode;
  final String? initialValue;
  final TextEditingController? controller;
  final bool enabled;
  final String? Function(String? completeNumber)? validator;
  final void Function(String completeNumber)? onChanged;
  final void Function(String completeNumber)? onSaved;

  const AppPhoneField({
    super.key,
    required this.label,
    this.initialCountryCode = 'IN',
    this.initialValue,
    this.controller,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      enabled: enabled,
      initialCountryCode: initialCountryCode,
      initialValue: initialValue,

      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),

      validator: (phone) {
        final number = phone?.completeNumber;
        return validator?.call(number);
      },

      onChanged: (phone) {
        onChanged?.call(phone.completeNumber);
      },

      onSaved: (phone) {
        if (phone != null) {
          onSaved?.call(phone.completeNumber);
        }
      },
    );
  }
}
