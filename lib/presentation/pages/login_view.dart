// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/presentation/pages/send_pin_code_screen.dart';
import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

class NewRegisterPage extends StatefulWidget {
  const NewRegisterPage({super.key});

  @override
  State<NewRegisterPage> createState() => _NewRegisterPageState();
}

class _NewRegisterPageState extends State<NewRegisterPage> {
  final _formKey = GlobalKey();
  final _key = GlobalKey();
  final ctlEmail = TextEditingController();
  final ctlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                LocaleKeys.voiti.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                width: 337,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: LocaleKeys.po_nomeru_telefona.tr(),
                    ),
                    Tab(
                      text: LocaleKeys.po_loginu.tr(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: IntlPhoneField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: '000 000 00 00'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xff272DC8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SendPinCodeScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                LocaleKeys.otpravit_cod.tr(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _key,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 16,
                                ),
                                child: TextFormField(
                                  controller: ctlEmail,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: LocaleKeys.login.tr()),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 16,
                                ),
                                child: TextFormField(
                                  controller: ctlPassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: LocaleKeys.parol.tr()),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                height: 50,
                                width: 350,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                      (states) => Color(0xff272DC8),
                                    ),
                                  ),
                                  onPressed: () => UserProfille().login(
                                      ctlEmail.text,
                                      ctlPassword.text,
                                      // 'begimaikozhonova5@gmail.com',
                                      // 'begimai2023',
                                      context),
                                  child: Text(
                                    LocaleKeys.voiti.tr(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                LocaleKeys.vosstanovit_parol.tr(),
                                style: TextStyle(
                                  color: Color(0xff0F4F9D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
