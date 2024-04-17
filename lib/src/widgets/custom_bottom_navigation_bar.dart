import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../di_injection.dart';
import '../core/app/colors.dart';
import '../core/app/medias.dart';
import '../features/user/main/presentation/cubit/nav_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(
      builder: (context, state) {
        print(state);
        return BottomNavigationBar(
          elevation: 8,
          backgroundColor: AppColor.scaffoldBackground,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.kBlack,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12.0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          unselectedFontSize: 12.0,
          currentIndex: state.index ?? 0,
          onTap: (int index) {
            print(index);
            sl.get<NavCubit>().changeCurrentIndex(index);
          },
          items: [
            custombottomitem(
              "Home",
              kHomeFilledSvg,
              kHomeOutlinedSvg,
            ),
            custombottomitem(
              "Orders",
              kReceiptFilledSvg,
              kReceiptOutlinedSvg,
            ),
            custombottomitem(
              "Wishlist",
              kHeartFilledSvg,
              kHeartOutlinedSvg,
            ),
            // custombottomitem("Field", kFieldSvg),
            custombottomitem(
              "Profile",
              kPersonFilledSvg,
              kPersonOutlinedSvg,
            ),
          ],
        );
      },
    );
  }
}

BottomNavigationBarItem custombottomitem(
    String? label, String activeIcon, String icon) {
  return BottomNavigationBarItem(
    label: label,
    activeIcon: BlocBuilder<NavCubit, NavState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 2.5),
          child: SvgPicture.asset(
            activeIcon,
          ),
        );
      },
    ),
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 2.5),
      child: SvgPicture.asset(
        icon,
      ),
    ),
  );
}
