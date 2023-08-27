import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/router/router.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/config/theme/no_talon_screen.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/presentation/widgets/height_container_widget.dart';
import 'package:flutter/material.dart';

import 'list_of_branches_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.userProfile}) : super(key: key);
  final UserProfille userProfile;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.eshe.tr(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 95,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const SizedBox(
                        // height: 40,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/profile.png',
                          ),
                          radius: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userProfile.user!.firstName.toString() +
                                " " +
                                userProfile.user!.lastName.toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            userProfile.user!.email.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                height: 140,
                child: Column(
                  children: [
                    TextAndIconWidget(
                      icons: Icons.inventory_2_outlined,
                      text: LocaleKeys.bankomaty.tr(),
                      onTapped: () {},
                    ),
                    TextAndIconWidget(
                      icons: Icons.maps_home_work_outlined,
                      text: LocaleKeys.ofisy.tr(),
                      onTapped: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ListOfBranchesScreen(user: userProfile)));
                      },
                    ),
                    TextAndIconWidget(
                      icons: Icons.confirmation_num_outlined,
                      text: LocaleKeys.moi_talony.tr(),
                      onTapped: () {
                        Routes.instance.push(
                            widget: const NoTalonScreen(), context: context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                height: 95,
                child: Column(
                  children: [
                    TextAndIconWidget(
                      icons: Icons.phone_outlined,
                      text: LocaleKeys.svyaz_s_bankom.tr(),
                      onTapped: () {},
                    ),
                    TextAndIconWidget(
                      icons: Icons.help_outline,
                      text: LocaleKeys.vopros_otvet.tr(),
                      onTapped: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                height: 46,
                child: TextAndIconWidget(
                  icons: Icons.handshake_outlined,
                  text: LocaleKeys.politika_usloviy.tr(),
                  onTapped: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                height: 140,
                child: Column(
                  children: [
                    TextAndIconWidget(
                      icons: Icons.password_outlined,
                      text: LocaleKeys.smenit_parol.tr(),
                      onTapped: () {},
                    ),
                    TextAndIconWidget(
                      icons: Icons.language_outlined,
                      text: LocaleKeys.smenit_yazyk.tr(),
                      onTapped: () {},
                    ),
                    TextAndIconWidget(
                      icons: Icons.screen_rotation_alt_outlined,
                      text: LocaleKeys.smenit_regim.tr(),
                      onTapped: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                height: 46,
                child: TextAndIconWidget(
                  icons: Icons.login_outlined,
                  text: LocaleKeys.vyiti.tr(),
                  onTapped: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
