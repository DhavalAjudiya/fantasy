import 'dart:ui';

import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';

cricketCard({
  String? header,
  String? subHeader,
  String? t1,
  String? t2,
  String? i1,
  String? i2,
  String? status,
  String? time,
  String? nr1,
  String? nr2,
  List<Color>? headerColor,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: SizeUtils.screenWidth * 0.7,
          height: SizeUtils.horizontalBlockSize * 6,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: headerColor!,
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: SizeUtils.screenWidth * 0.02),
              child: AppText(
                header ?? "",
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: SizeUtils.fSize_12(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeUtils.screenHeight * 0.01,
        ),
        Stack(
          children: [
            Positioned(
              left: -15,
              top: 3,
              child: Container(
                height: SizeUtils.horizontalBlockSize * 17,
                width: SizeUtils.horizontalBlockSize * 17,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(i1 ?? ""),
                    opacity: 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -15,
              top: 3,
              child: Container(
                height: SizeUtils.horizontalBlockSize * 17,
                width: SizeUtils.horizontalBlockSize * 17,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(i2 ?? ""),
                    opacity: 0.1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeUtils.horizontalBlockSize * 3.5,
                  horizontal: SizeUtils.horizontalBlockSize * 3),
              child: Row(
                children: [
                  imageLoader(
                    h: SizeUtils.horizontalBlockSize * 12,
                    w: SizeUtils.horizontalBlockSize * 12,
                    url: i1 ?? "",
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        t1 ?? "",
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_18(),
                      ),
                      Row(
                        children: [
                          AppText(
                            nr1?.split("|").first ?? "",
                            fontWeight: FontWeight.w500,
                            color: AppColor.black.withOpacity(0.5),
                            fontSize: SizeUtils.fSize_13(),
                          ),
                          AppText(
                            "(${nr1?.split("|").last ?? ""})",
                            fontWeight: FontWeight.w400,
                            fontSize: SizeUtils.fSize_10(),
                            color: AppColor.black.withOpacity(0.5),

                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      AppText(
                        status ?? "",
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                        fontSize:  SizeUtils.fSize_14(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        t2 ?? "",
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_18(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText(
                            nr2?.split("|").first ?? "",
                            fontWeight: FontWeight.w500,
                            fontSize: SizeUtils.fSize_13(),
                            color: AppColor.black.withOpacity(0.5),

                          ),
                          AppText(
                            "(${nr2?.split("|").last ?? ""})",
                            fontWeight: FontWeight.w400,
                            fontSize: SizeUtils.fSize_10(),
                            color: AppColor.black.withOpacity(0.5),

                          ),

                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  imageLoader(
                    h: SizeUtils.horizontalBlockSize * 12,
                    w: SizeUtils.horizontalBlockSize * 12,
                    url: i2 ?? "",
                  ),
                ],
              ),
            ),

          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Divider(
            color: AppColor.appBarColor.withOpacity(0.7),
          ),
        ),
          Padding(
            padding: EdgeInsets.only(
              bottom: SizeUtils.horizontalBlockSize * 1,
              left: SizeUtils.horizontalBlockSize * 3.5,
            ),
            child: AppText(
              subHeader?.toUpperCase() ?? "",
              fontWeight: FontWeight.bold,
              fontSize: SizeUtils.fSize_11(),
              color: AppColor.smsBtn,
            ),
          ),
      ],
    ),
  );
}
upComingCricketCard({
  String? header,
  String? subHeader,
  String? t1,
  String? t2,
  String? i1,
  String? i2,
  String? status,
  String? time,
  List<Color>? headerColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: SizeUtils.screenWidth * 0.7,
        height: SizeUtils.horizontalBlockSize * 6,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(12)),
          gradient: LinearGradient(
            colors: headerColor!,
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: SizeUtils.screenWidth * 0.02),
          child: AppText(
            header ?? "",
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: SizeUtils.fSize_12(),
          ),
        ),
      ),
      SizedBox(
        height: SizeUtils.screenHeight * 0.01,
      ),
      Stack(
        children: [
          Positioned(
            left: -15,
            top: 3,
            child: Container(
              height: SizeUtils.horizontalBlockSize * 17,
              width: SizeUtils.horizontalBlockSize * 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(i1 ?? ""),
                  opacity: 0.2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: -15,
            top: 3,
            child: Container(
              height: SizeUtils.horizontalBlockSize * 17,
              width: SizeUtils.horizontalBlockSize * 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(i2 ?? ""),
                  opacity: 0.1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.horizontalBlockSize * 3.5,
                horizontal: SizeUtils.horizontalBlockSize * 2.5),
            child: Row(
              children: [
                imageLoader(
                  h: SizeUtils.horizontalBlockSize * 12,
                  w: SizeUtils.horizontalBlockSize * 12,
                  url: i1 ?? "",
                ),
                /*    Container(
                  height: SizeUtils.horizontalBlockSize * 12,
                  width: SizeUtils.horizontalBlockSize * 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(i1 ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),*/
                const SizedBox(width: 5),
                AppText(
                  t1 ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: SizeUtils.fSize_17(),
                ),
                const Spacer(),
                Column(
                  children: [
                    AppText(
                      status ?? "",
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                      fontSize:  SizeUtils.fSize_12(),
                    ),

                    AppText(
                      time ?? "",
                      fontSize: SizeUtils.fSize_11(),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
                const Spacer(),
                AppText(
                  t2 ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: SizeUtils.fSize_17(),
                ),
                const SizedBox(width: 5),
                imageLoader(
                  h: SizeUtils.horizontalBlockSize * 12,
                  w: SizeUtils.horizontalBlockSize * 12,
                  url: i2 ?? "",
                ),
                /*   Container(
                  height: SizeUtils.horizontalBlockSize * 12,
                  width: SizeUtils.horizontalBlockSize * 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(i2 ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Divider(
          color: AppColor.appBarColor.withOpacity(0.7),
        ),
      ),

        Padding(
          padding: EdgeInsets.only(
            bottom: SizeUtils.horizontalBlockSize * 1,
            left: SizeUtils.horizontalBlockSize * 3.5,
          ),
          child: AppText(
            subHeader?.toUpperCase() ?? "",
            fontWeight: FontWeight.bold,
            fontSize: SizeUtils.fSize_11(),
              color: AppColor.appBarColor.withOpacity(0.5)            ),
        ),
    ],
  );
}
