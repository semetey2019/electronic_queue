import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/router/router.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/config/theme/my_ticket_screen.dart';
import 'package:electronic_queue/domain/models/branch_mdeol.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/domain/models/services_corporatr_model.dart';
import 'package:flutter/material.dart';

class SuccessfullyBookedAQueue extends StatelessWidget {
  const SuccessfullyBookedAQueue(
      {Key? key,
      required this.dataPoseniya,
      required this.uslugi,
      required this.filial,
      required this.user})
      : super(key: key);
  final DateTime dataPoseniya;
  final CorporateModel uslugi;
  final BrancheModel filial;
  final UserProfille user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline_rounded,
                color: Colors.green, size: 100),
            const SizedBox(height: 20),
            Text(LocaleKeys.vy_uspeshno.tr(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            Text(
              'Дата приема - ' +
                  DateFormat('d MMM yyyy').format(dataPoseniya) +
                  ' Вы должны ввести активационный код в терминале',
              // LocaleKeys.data_priema.tr(),
              style: const TextStyle(fontSize: 13, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                Routes.instance.push(
                    widget: MyTicketScreen(
                      visitTime: dataPoseniya,
                      filial: filial,
                      uslugi: uslugi,
                      user: user,
                    ),
                    context: context);
              },
              child: Text(LocaleKeys.posmotret.tr(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
