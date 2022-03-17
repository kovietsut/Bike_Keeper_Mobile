import 'package:mobile/global/global_variable.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/avatar_container.dart';
import 'package:mobile/widgets/base/gradient_background.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  final double height;

  const HomeHeader({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 10,
          offset: const Offset(0, 3), // changes position of shadow
        )
      ]),
      child: GradientBackground(
        width: size.width,
        height: height,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        colors: const [PRIME_BLUE, ASCENT_BLUE],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: MAIN_LAYOUT_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 18,
                      offset: const Offset(0, 3), // changes position of shadow
                    )
                  ],
                  borderRadius: BorderRadius.circular(54),
                ),
                child: AvatarContainer(
                  assetImage: CachedNetworkImageProvider(currentUser!.imgUrl),
                  radius: 54,
                ),
              ),
              const SizedBox(height: MAIN_LAYOUT_PADDING / 1.5),
              Text(
                currentUser!.account.userFullName.toUpperCase(),
                style: GoogleFonts.montserrat(fontSize: 20, color: PRIME_WHITE),
              ),
              const SizedBox(height: MAIN_LAYOUT_PADDING / 8),
              Text(
                currentUser!.account.email,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: PRIME_WHITE.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
