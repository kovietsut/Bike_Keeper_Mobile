import 'package:mobile/global/global_variable.dart';
import 'package:mobile/helpers/string_helper.dart';
import 'package:mobile/screens/login/signin_screen.dart';
import 'package:mobile/services/authentication_service/authentication_service.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/base/base_ontap_widget.dart';
import 'package:mobile/widgets/light_shadow_container.dart';
import 'package:mobile/widgets/no_glow_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContent extends StatelessWidget {
  final double height;

  const ProfileContent({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var account = currentUser!.account;
    return SizedBox(
      height: height,
      child: NoGlowContainer(
        child: ListView(
          padding: const EdgeInsets.only(top: MAIN_LAYOUT_PADDING / 2),
          children: [
            LightShadowContainer(
              margin: const EdgeInsets.symmetric(
                  vertical: MAIN_LAYOUT_PADDING / 3,
                  horizontal: MAIN_LAYOUT_PADDING),
              padding: const EdgeInsets.all(MAIN_LAYOUT_PADDING / 2),
              child: Column(
                children: [
                  const ProfileSectionBoxTitle(title: "Personal Information"),
                  const ProfileSectionIndicator(),
                  const ProfileSectionRow(
                      icon: Icons.cake, text: "Date of Birth: 2001-12-22"),
                  const SizedBox(height: MAIN_LAYOUT_PADDING / 4),
                  ProfileSectionRow(
                      icon: Icons.face_retouching_natural,
                      text: "Gender: " +
                          StringHelper.qualifiedString(account.gender)),
                  const SizedBox(height: MAIN_LAYOUT_PADDING / 4),
                  ProfileSectionRow(
                      icon: Icons.timelapse_rounded,
                      text: StringHelper.qualifiedString(account.status)),
                ],
              ),
            ),
            LightShadowContainer(
              margin: const EdgeInsets.symmetric(
                  vertical: MAIN_LAYOUT_PADDING / 3,
                  horizontal: MAIN_LAYOUT_PADDING),
              padding: const EdgeInsets.all(MAIN_LAYOUT_PADDING / 2),
              child: Column(
                children: [
                  const ProfileSectionBoxTitle(title: "Contact"),
                  const ProfileSectionIndicator(),
                  ProfileSectionRow(
                      icon: Icons.email, text: "Email: " + account.email),
                  const SizedBox(height: MAIN_LAYOUT_PADDING / 4),
                  ProfileSectionRow(
                      icon: Icons.phone_android, text: account.phoneNumber),
                  const SizedBox(height: MAIN_LAYOUT_PADDING / 4),
                  ProfileSectionRow(
                    icon: Icons.location_on_sharp,
                    text: StringHelper.qualifiedString(account.address),
                  ),
                ],
              ),
            ),
            LightShadowContainer(
              margin: const EdgeInsets.symmetric(
                  vertical: MAIN_LAYOUT_PADDING / 3,
                  horizontal: MAIN_LAYOUT_PADDING),
              padding: const EdgeInsets.all(MAIN_LAYOUT_PADDING / 2),
              child: Column(
                children: const [
                  ProfileSectionBoxTitle(title: "Description"),
                  ProfileSectionIndicator(),
                  ProfileSectionRow(
                      icon: Icons.av_timer, text: "Create on: 1/1/2020"),
                  SizedBox(height: MAIN_LAYOUT_PADDING / 4),
                  ProfileSectionRow(
                      icon: Icons.accessibility_new, text: "Manage by: PhatNT"),
                  SizedBox(height: MAIN_LAYOUT_PADDING / 4),
                  ProfileSectionRow(
                      icon: Icons.calendar_today,
                      text: "Total worked days: 211 days"),
                  SizedBox(height: MAIN_LAYOUT_PADDING / 4),
                  ProfileSectionRow(
                      icon: Icons.calendar_view_day,
                      text: "Work group: FPT Software"),
                ],
              ),
            ),
            const SizedBox(height: MAIN_LAYOUT_PADDING / 3),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: MAIN_LAYOUT_PADDING),
              padding: const EdgeInsets.symmetric(
                  horizontal: MAIN_LAYOUT_PADDING / 2),
              child: BaseOnTapWidget(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Edit profile".toUpperCase(),
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                        color: PRIME_BLACK.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: PRIME_BLACK,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 20,
                        color: ABSOLUTE_WHITE,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: MAIN_LAYOUT_PADDING / 3),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: MAIN_LAYOUT_PADDING),
              padding: const EdgeInsets.symmetric(
                  horizontal: MAIN_LAYOUT_PADDING / 2),
              child: BaseOnTapWidget(
                onTap: () {
                  AuthenticationService().signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignInScreen()),
                      ModalRoute.withName('/'));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sign out".toUpperCase(),
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                        color: PRIME_BLACK.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: PRIME_BLACK,
                      ),
                      child: const Icon(
                        Icons.logout,
                        size: 20,
                        color: ABSOLUTE_WHITE,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: MAIN_LAYOUT_PADDING / 2),
          ],
        ),
      ),
    );
  }
}

class ProfileSectionIndicator extends StatelessWidget {
  const ProfileSectionIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MAIN_LAYOUT_PADDING / 2,
      margin: const EdgeInsets.only(top: MAIN_LAYOUT_PADDING / 4),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: PRIME_LIGHT_GRAY.withOpacity(0.5)))),
    );
  }
}

class ProfileSectionRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ProfileSectionRow({
    Key? key,
    required this.icon,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w200,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ASCENT_BLUE,
            ),
            child: Icon(
              icon,
              size: fontSize + 3,
              color: ABSOLUTE_WHITE,
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              text,
              softWrap: true,
              maxLines: 10,
              style: GoogleFonts.montserrat(
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSectionBoxTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;

  const ProfileSectionBoxTitle({
    Key? key,
    required this.title,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          color: PRIME_BLACK.withOpacity(0.9),
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
