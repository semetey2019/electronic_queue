import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/router/router.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/config/theme/no_talon_screen.dart';
import 'package:electronic_queue/domain/models/branch_mdeol.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/domain/models/services_corporatr_model.dart';
import 'package:flutter/material.dart';

class MyTicketScreen extends StatelessWidget {
  MyTicketScreen(
      {Key? key,
      required this.visitTime,
      required this.filial,
      required this.uslugi,
      required this.user})
      : super(key: key);
  final DateTime visitTime;
  final BrancheModel filial;
  final CorporateModel uslugi;
  final UserProfille user;

  String _chosenDateTime =
      DateFormat('yyyy-MM-dd hh-mm-sss').format(DateTime.now());
  DateTime aa = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             ProfileScreen(userProfile: user)));
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                LocaleKeys.moi_talon.tr(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(179, 237, 232, 232),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              LocaleKeys.vash_kod.tr(),
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            // '${visitTime.year}-${visitTime.month}-${visitTime.day}T${visitTime.hour}:${visitTime.minute}:${visitTime.second}',
                            const Text(
                              '1254',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(LocaleKeys.data_posesheniya.tr(),
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey)),
                        Text(
                          '${visitTime.year}-${visitTime.month}-${visitTime.day} ${visitTime.hour}:${visitTime.minute}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        const Text('Услуга',
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                        Text(
                          uslugi.name.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        Text(LocaleKeys.adres_filiala.tr(),
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey)),
                        Text(
                          filial.address.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              // Routes.instance
              //     .push(widget: const QrCodeScreen(), context: context);
            },
            child: Text(LocaleKeys.skanirovat_QR.tr(),
                style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showDialog(context);
              Future.delayed(const Duration(minutes: 20), () {
                Navigator.pop(context);
              });
            },
            child: Text(LocaleKeys.otmenit.tr(),
                style: TextStyle(color: Colors.red)),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shadowColor: Colors.red,
                foregroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    )));
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            return Container(
              width: 360,
              height: 220,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Routes.instance.push(
                            widget: const NoTalonScreen(), context: context);
                      },
                      child: const Icon(
                        Icons.highlight_off_outlined,
                        color: Colors.red,
                        size: 100,
                      ),
                    ),
                    Text(LocaleKeys.vy_otmenili_talon.tr(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
