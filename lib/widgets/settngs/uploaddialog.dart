import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadDialog extends StatelessWidget {
  const UploadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(10),
              color: AppColors.black,
              strokeWidth: 1,
              dashPattern: [6, 6],
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width > 800
                  ? MediaQuery.sizeOf(context).width * 0.4
                  : double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),

              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/settings/drag.svg",
                    width: 45,
                    height: 45,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Drag your file(s) to start uploading",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.primary,
                      color: Color(0xFF0B0B0B),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 100),
                            child: Divider(
                              color: AppColors.barFillGrey,
                              thickness: 1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text("OR", style: TextStyle(color: Colors.grey)),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 100),
                            child: Divider(
                              color: AppColors.barFillGrey,
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.authHeading),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: const Text(
                          "Browse files",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
