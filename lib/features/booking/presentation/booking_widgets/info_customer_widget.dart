import 'package:flutter/material.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final phoneKey = GlobalKey<FormState>();
final emailKey = GlobalKey<FormState>();

class InfoCustomerWidget extends StatefulWidget {
  const InfoCustomerWidget({super.key});

  @override
  State<InfoCustomerWidget> createState() => _InfoCustomerWidgetState();
}

class _InfoCustomerWidgetState extends State<InfoCustomerWidget> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Информация о покупателе',
            style: AppTextTheme.roomName,
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: phoneKey,
            child: TextFormField(
              controller: _phoneController,
              validator: validatePhone,
              inputFormatters: [maskFormatter],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorStyle:
                    const TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(235, 87, 87, 1))),
                labelText: 'Номер телефона',
                labelStyle: AppTextTheme.touristTextStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.all(16),
                fillColor: const Color.fromRGBO(246, 246, 249, 1),
                filled: true,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Form(
            key: emailKey,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
              validator: validateEmail,
              decoration: InputDecoration(
                  errorStyle:
                      const TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(235, 87, 87, 1))),
                  labelText: 'Почта',
                  labelStyle: AppTextTheme.touristTextStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: const Color.fromRGBO(246, 246, 249, 1),
                  filled: true),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Эти данные никому не передаются. После оплаты мы вышлим чек на указанный вами номер и почту',
            style: AppTextTheme.infoCustomer,
            maxLines: 2,
          )
        ],
      ),
    );
  }

  String? validateEmail(String? value) {
    RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    RegExp regexRu = RegExp(r'[А-Яа-яЁё]');
    if (!regex.hasMatch(value ?? '') || regexRu.hasMatch(value ?? '')) {
      return 'Enter valid email';
    } else
      return null;
  }
}

var maskFormatter = MaskTextInputFormatter(
  initialText: '+7',
  mask: '+# (###) ###-##-##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

String? validatePhone(String? value) {
  if (value!.isEmpty || value == '') {
    return 'Enter valid phone number';
  } else {
    return null;
  }
}
// ([U+0400–U+04FF]|\w)+
// [U+0400–U+04FF]|\w