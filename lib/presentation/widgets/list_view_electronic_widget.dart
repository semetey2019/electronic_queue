import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/domain/models/branch_mdeol.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/presentation/widgets/radio_buttton_widget.dart';
import 'package:flutter/material.dart';

import 'height_container_widget.dart';

class ListViewBuilderWidget extends StatelessWidget {
  final List<BrancheModel> branchItems;
  final UserProfille user;

  const ListViewBuilderWidget({
    super.key,
    required this.branchItems,
    required this.user,
  });
  void _showDateAndTimeDialog(BuildContext context, BrancheModel branchItem) {
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
              return SizedBox(
                width: 500,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/image 10.png',
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            branchItem.address.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            'Центр денежных переводов',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                LocaleKeys.otkryto.tr(),
                              ),
                            ],
                          ),
                          Radiobutton(branchItem: branchItem, user: user),
                        ],
                      ),
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: branchItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              _showDateAndTimeDialog(context, branchItems[index]);
              // Routes.instance.push(
              //     widget: Radiobutton(branchItem: branchItems[index]),
              //     context: context);
            },
            child: HeightContainerWidget(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            branchItems[index].address.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            branchItems[index].description.toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(LocaleKeys.elektronnyi_ochered.tr()),
                            ],
                          )
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
