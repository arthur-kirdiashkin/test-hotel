import 'package:flutter/material.dart';

abstract class AppTextTheme {
  static const basicRating = TextStyle(
      fontFamily: 'SFProDisplayMedium',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(255, 168, 0, 1));

  static const basicAddress = TextStyle(
      fontFamily: 'SFProDisplayMedium',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(13, 114, 255, 1));

  static const basicName = TextStyle(
    fontFamily: 'SFProDisplayMedium',
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const minimalPrice = TextStyle(
    fontFamily: 'SFProDisplaySemibold',
    fontSize: 30,
  );

  static const priceForIt = TextStyle(
      fontFamily: 'SFProDisplayRegular',
      fontSize: 16,
      color: Color.fromRGBO(130, 135, 150, 1));

  static const chooseNumber = TextStyle(
    fontFamily: 'SFProDisplayMedium',
    fontSize: 16,
  );

  static const infoHotel = TextStyle(
      fontFamily: 'SFProDisplayMedium',
      fontSize: 16,
      color: Color.fromRGBO(130, 135, 150, 1));

  static const textHotel = TextStyle(
    fontFamily: 'SFProDisplayMedium',
    fontSize: 22,
  );

  static const hotelDescription = TextStyle(
    fontFamily: 'SFProDisplayRegular',
    fontSize: 16,
  );
  static const titleCardIcon = TextStyle(
      fontFamily: 'SFProDisplayMedium',
      fontSize: 16,
      color: Color.fromRGBO(44, 48, 53, 1));

  static const subTitleCardIcon = TextStyle(
    fontFamily: 'SFProDisplayMedium',
    fontSize: 14,
    color: Color.fromRGBO(130, 135, 150, 1),
  );

  static const titleHotel = TextStyle(
      fontFamily: 'SFProDisplayMedium',
      fontWeight: FontWeight.w500,
      fontSize: 18);

  static const roomName = TextStyle(
    fontFamily: 'SFProDisplayMedium',
    fontSize: 22,
  );

  static const roomBasicName = TextStyle(
    fontFamily: 'SFProDisplayMedium',
    fontSize: 18,
    overflow: TextOverflow.ellipsis,
  );

  static const roomPeculiarities = TextStyle(
      fontFamily: 'SFProDisplayMedium',
      fontSize: 16,
      color: Color.fromRGBO(130, 135, 150, 1));

  static const infoCustomer = TextStyle(
    fontFamily: 'SFProDisplayRegular',
    fontSize: 14,
    color: Color.fromRGBO(130, 135, 150, 1),
  );

  static const touristTextStyle = TextStyle(
      fontFamily: 'SFProDisplayRegular',
      fontSize: 17,
      color: Color.fromRGBO(169, 171, 183, 1));
}
