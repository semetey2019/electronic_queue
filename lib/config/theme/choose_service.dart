import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/router/router.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/domain/models/branch_mdeol.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/domain/models/services_corporatr_model.dart';
import 'package:electronic_queue/presentation/widgets/height_container_widget.dart';
import 'package:electronic_queue/presentation/widgets/successfully_booked_a_queue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ATMScreen extends StatefulWidget {
  const ATMScreen(
      {Key? key,
      required this.serviceItems,
      required this.filial,
      required this.user})
      : super(key: key);
  final List<CorporateModel> serviceItems;
  final BrancheModel filial;
  final UserProfille user;

  @override
  State<ATMScreen> createState() => _ATMScreenState();
}

class _ATMScreenState extends State<ATMScreen> {
  late CorporateModel uslugi;
  String _chosenDateTime =
      DateFormat('yyyy-MM-dd hh-mm').format(DateTime.now());
  DateTime aa = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Text("${widget.id!.name}"),
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
                  Text(
                    LocaleKeys.obslujivanie_fiz.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 10),
              HeightContainerWidget(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.data_posesheniya.tr(),
                        ),
                        CupertinoPageScaffold(
                          child: SafeArea(
                            child: Center(
                              child: GestureDetector(
                                onTap: () => _showDatePicker(context),
                                child: Container(
                                  width: 200,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 240, 240, 240),
                                  ),
                                  child: Center(
                                    child: Text(
                                        _chosenDateTime != null
                                            ? _chosenDateTime.toString()
                                            : 'No date',
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              const SizedBox(height: 10),

              HeightContainerWidget(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: InkWell(
                    onTap: () => _showServicesDialog(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.vyboruslug.tr(),
                        ),
                        const Icon(CupertinoIcons.chevron_down),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  "${widget.filial.name}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 10),
              const SizedBox(height: 440),
              ElevatedButton(
                onPressed: () {
                  Routes.instance.push(
                      widget: SuccessfullyBookedAQueue(
                        dataPoseniya: aa,
                        uslugi: uslugi,
                        filial: widget.filial,
                        user: widget.user,
                      ),
                      context: context);
                },
                // ignore: sort_child_properties_last
                child: Text(
                  LocaleKeys.zanyat_ochered.tr(),
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(345, 40),
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showServicesDialog(BuildContext context) {
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
                width: 200,
                height: 298,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.vyboruslug.tr(),
                          ),
                          const Icon(
                            CupertinoIcons.chevron_up,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: widget.serviceItems
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  uslugi = e;
                                  Navigator.pop(context);
                                },
                                child: Card(
                                  child: HeightContainerWidget(
                                    height: 46,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              e.name!,
                                              // style:
                                              //     const TextStyle(fontSize: 16),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          const Expanded(
                                            flex: 1,
                                            child: Icon(
                                                CupertinoIcons.chevron_right),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showDatePicker(BuildContext ctx) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              return Expanded(
                child: Container(
                  height: 372,
                  width: 300,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 0)),
                            maximumDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              setState(() {
                                aa = val;
                                _chosenDateTime =
                                    DateFormat('yyyy-MM-dd hh:mm').format(val);
                              });
                            }),
                      ),

                      // Close the modal
                      CupertinoButton(
                          child: const Text('OK',
                              style: TextStyle(color: Colors.blue)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
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
}
