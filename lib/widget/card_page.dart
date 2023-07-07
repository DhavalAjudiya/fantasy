import 'dart:ui';

import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
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
  bool isSubHeader = false,
  bool isStatus = false,
}) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: SizeUtils.horizontalBlockSize * 3,
              left: SizeUtils.horizontalBlockSize * 3.5,
            ),
            child: AppText(
              header ?? "",
              fontWeight: FontWeight.w500,
              fontSize: SizeUtils.fSize_13(),
            ),
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
                      opacity: 0.1,
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
                    horizontal: SizeUtils.horizontalBlockSize * 3.5),
                child: Row(
                  children: [
                    Container(
                      height: SizeUtils.horizontalBlockSize * 12,
                      width: SizeUtils.horizontalBlockSize * 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(i1 ?? ""),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AppText(
                      t1 ?? "",
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_18(),
                    ),
                    const Spacer(),
                    Column(children: [
                      AppText(
                        status ?? "",
                        fontWeight: FontWeight.bold,
                        fontSize: isStatus ? SizeUtils.fSize_12() : SizeUtils.fSize_15(),
                      ),
                      AppText(
                        time ?? "",
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ]),
                    const Spacer(),
                    AppText(
                      t2 ?? "",
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_18(),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: SizeUtils.horizontalBlockSize * 12,
                      width: SizeUtils.horizontalBlockSize * 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(i2 ?? ""),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isSubHeader
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeUtils.horizontalBlockSize * 3,
                    left: SizeUtils.horizontalBlockSize * 3.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        nr1 ?? "",
                        fontWeight: FontWeight.w500,
                        fontSize: SizeUtils.fSize_13(),
                      ),
                      AppText(
                        nr2 ?? "",
                        fontWeight: FontWeight.w500,
                        fontSize: SizeUtils.fSize_13(),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeUtils.horizontalBlockSize * 3,
                    left: SizeUtils.horizontalBlockSize * 3.5,
                  ),
                  child: AppText(
                    subHeader ?? "",
                    fontWeight: FontWeight.w500,
                    fontSize: SizeUtils.fSize_13(),
                  ),
                ),
        ],
      ),
    ],
  );
}
