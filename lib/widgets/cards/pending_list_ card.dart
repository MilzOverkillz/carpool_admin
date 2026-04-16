import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PendingListCard extends StatelessWidget {
  final List<String> companies;

  const PendingListCard({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                "Pending List",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: AppFonts.primary, color: Color(0xff464255)),
              ),
              Text('Listings awaiting approval', style: TextStyle(fontFamily: AppFonts.dmSans, fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: -0.02,color:Color(0xffa3aed0) ),)
                ],
              ),

              Container(
                width: 71,
                height: 21,
                decoration: BoxDecoration(border: Border.all(color: Color(0xffa6a6a6)), borderRadius: BorderRadius.circular(10)),
                child: Align(alignment: Alignment.center, child: Text("View All", style: TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w600, fontSize: 10, color: AppColors.black),)),
              )
            ],
          ),

          const SizedBox(height: 16),

          /// LIST
          ...companies.map((company) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/dashboard/approval.svg'),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      company,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, color: Color(0xff1e272e)),
                    ),
                  ),

                  Container(
                    width: 54,
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      color: Color(0xffc7c9cb)
                    ),
                    child: Align(alignment: Alignment.center, child: Text('View',style: TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w400, fontSize: 10, color:Color(0xff1e272e)), )),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}