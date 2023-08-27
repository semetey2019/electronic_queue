import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/domain/models/branch_mdeol.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/domain/repositories/branch_service.dart';
import 'package:electronic_queue/presentation/widgets/list_view_electronic_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfBranchesScreen extends StatefulWidget {
  const ListOfBranchesScreen({super.key, required this.user});
  final UserProfille user;

  @override
  State<ListOfBranchesScreen> createState() => _ListOfBranchesScreenState();
}

class _ListOfBranchesScreenState extends State<ListOfBranchesScreen> {
  List<String> list = [
    LocaleKeys.bish.tr(),
    LocaleKeys.osh.tr(),
    LocaleKeys.talas.tr(),
    LocaleKeys.yssykkul.tr(),
    LocaleKeys.naryn.tr(),
    LocaleKeys.jalalabad.tr(),
    LocaleKeys.chuiskaya_oblast.tr(),
    LocaleKeys.oshh.tr(),
    LocaleKeys.batken.tr(),
  ];
  List<BrancheModel>? branchesList;

  initBranch() async {
    branchesList = await BracnhService().getAllBranches();
    print(branchesList);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initBranch();
    currentItem = list[0];
    print(branchesList?.toList());
  }

  String currentItem = "";

  get branchesList1 => null;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: branchesList != null ? 2 : 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const SizedBox(
                      width: 40,
                    ),
                    DropdownButton<String>(
                      value: currentItem,
                      selectedItemBuilder: (context) {
                        return list.map<Widget>((String item) {
                          return Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                item,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList();
                      },
                      borderRadius: BorderRadius.circular(10),
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      icon: const Icon(
                        CupertinoIcons.chevron_down,
                        size: 16,
                      ),
                      style: const TextStyle(color: Colors.deepPurple),
                      onChanged: (value) {
                        setState(() {
                          currentItem = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            onTap: () {},
                            alignment: Alignment.center,
                            child: Container(
                              width: 250,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  value,
                                  style: const TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ));
                      }).toList(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (branchesList != null)
                  TabBar(
                    indicatorPadding: const EdgeInsets.all(6),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: null,
                    labelColor: Colors.black,
                    indicator: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    tabs: [
                      Tab(
                        text: LocaleKeys.otkryto.tr(),
                      ),
                      Tab(
                        text: LocaleKeys.elektronnyi_ochered.tr(),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      if (branchesList != null)
                        ListViewBuilderWidget(
                          branchItems: branchesList!,
                          user: widget.user,
                        ),
                      if (branchesList != null)
                        ListViewBuilderWidget(
                          branchItems: branchesList!,
                          user: widget.user,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
