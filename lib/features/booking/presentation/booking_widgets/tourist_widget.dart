import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';

// final touristFormKey = GlobalKey<FormState>();
final nameFormKey = GlobalKey<FormState>();
final surnameFormKey = GlobalKey<FormState>();
final birthdayFormKey = GlobalKey<FormState>();
final citizenshipFormKey = GlobalKey<FormState>();
final numberPassportFormKey = GlobalKey<FormState>();
final periodFormKey = GlobalKey<FormState>();

class Tourist extends StatefulWidget {
  final String touristText;
  const Tourist({super.key, required this.touristText});

  @override
  State<Tourist> createState() => _TouristState();
}

class _TouristState extends State<Tourist> {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: ExpansionTile(
        trailing: SvgPicture.asset('assets/expansion-icon.svg'),
        title: Text(
          widget.touristText,
          style: AppTextTheme.textHotel,
        ),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
            child: Form(
              key: nameFormKey,
              child: TextFormField(
                validator: validateTourist,
                decoration: InputDecoration(
                  errorStyle:
                      const TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(235, 87, 87, 1))),
                  labelText: 'Имя',
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Form(
              key: surnameFormKey,
              child: TextFormField(
                validator: validateTourist,
                decoration: InputDecoration(
                    errorStyle:
                        const TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(235, 87, 87, 1))),
                    labelText: 'Фамилия',
                    labelStyle: AppTextTheme.touristTextStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: const Color.fromRGBO(246, 246, 249, 1),
                    filled: true),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Form(
              key: birthdayFormKey,
              child: TextFormField(
                validator: validateTourist,
                decoration: InputDecoration(
                    errorStyle:
                        const TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(235, 87, 87, 1))),
                    labelText: 'Дата рождения',
                    labelStyle: AppTextTheme.touristTextStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: const Color.fromRGBO(246, 246, 249, 1),
                    filled: true),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Form(
              key: citizenshipFormKey,
              child: TextFormField(
                validator: validateTourist,
                decoration: InputDecoration(
                    errorStyle:
                        const TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(235, 87, 87, 1))),
                    labelText: 'Гражданство',
                    labelStyle: AppTextTheme.touristTextStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: const Color.fromRGBO(246, 246, 249, 1),
                    filled: true),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Form(
              key: numberPassportFormKey,
              child: TextFormField(
                validator: validateTourist,
                decoration: InputDecoration(
                    errorStyle:
                        const TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(235, 87, 87, 1))),
                    labelText: 'Номер загранпаспорта',
                    labelStyle: AppTextTheme.touristTextStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: const Color.fromRGBO(246, 246, 249, 1),
                    filled: true),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Form(
              key: periodFormKey,
              child: TextFormField(
                validator: validateTourist,
                decoration: InputDecoration(
                    errorStyle:
                        const TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(235, 87, 87, 1))),
                    labelText: 'Срок действия загранпаспорта',
                    labelStyle: AppTextTheme.touristTextStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: const Color.fromRGBO(246, 246, 249, 1),
                    filled: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String? validateTourist(String? value) {
  if (value!.isEmpty || value == '') {
    return 'Enter valid text';
  } else {
    return null;
  }
}
