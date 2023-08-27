import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/router/router.dart';
import 'package:electronic_queue/config/theme/choose_service.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/domain/models/branch_mdeol.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/domain/models/services_corporatr_model.dart';
import 'package:electronic_queue/domain/repositories/services_corporate.dart';
import 'package:electronic_queue/domain/repositories/services_individual.dart';
import 'package:flutter/material.dart';

class Radiobutton extends StatefulWidget {
  const Radiobutton({
    super.key,
    required this.branchItem,
    required this.user,
  });
  final BrancheModel branchItem;
  final UserProfille user;

  @override
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State<Radiobutton> {
  List<CorporateModel>? corporateService;
  List<CorporateModel>? soloService;
  Future initService() async {
    corporateService = await ServicesCorporate().getAllCorporate();
    soloService = await ServicesIndividual().getAllIndividual();
    print(corporateService);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initService();

    print(corporateService?.toList());
  }

  String radioItem = '';
  late List<CorporateModel> serviceItems;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          activeColor: Colors.blue,
          title: Text(
            LocaleKeys.yurlits.tr(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          groupValue: radioItem,
          value: 'Item 1',
          onChanged: (val) {
            setState(() {
              radioItem = val!;
              serviceItems = corporateService!;
            });
          },
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          groupValue: radioItem,
          activeColor: Colors.blue,
          title: Text(
            LocaleKeys.fizluts.tr(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          value: 'Item 2',
          onChanged: (val) {
            setState(() {
              radioItem = val!;
              serviceItems = soloService!;
            });
          },
        ),
        const SizedBox(height: 10),
        radioItem != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Column(
                      children: [
                        Text(
                          'Пн',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text('09:00 \n18:00')
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Column(
                      children: [
                        Text(
                          'Вт',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text('09:00 \n18:00')
                      ],
                    ),
                  ),
                  Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        children: [
                          Text(
                            'Ср',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('09:00 \n18:00')
                        ],
                      )),
                  Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        children: [
                          Text(
                            'Чт',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('09:00 \n18:00')
                        ],
                      )),
                  Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        children: [
                          Text(
                            'Пт',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('09:00 \n18:00')
                        ],
                      )),
                ],
              )
            : SizedBox(),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Routes.instance.push(
                widget: ATMScreen(
                  serviceItems: serviceItems,
                  filial: widget.branchItem,
                  user: widget.user,
                ),
                context: context);
          },
          child: Text(
            LocaleKeys.zanyat_ochered.tr(),
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(345, 40),
              primary: radioItem != null
                  ? const Color.fromARGB(255, 166, 184, 192)
                  : Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        )
      ],
    );
  }
}
