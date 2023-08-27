// ignore_for_file: depend_on_referenced_packages

import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/router/router.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/domain/models/register.dart';
import 'package:electronic_queue/presentation/pages/send_pin_code_screen.dart';
import 'package:electronic_queue/utils/extensions/network_client.dart';
import 'package:electronic_queue/utils/extensions/remote_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _phoneController = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  final _formKey = GlobalKey();
  final _key = GlobalKey();
  final ctlLastName = TextEditingController();
  final ctlFirstName = TextEditingController();
  final ctlEmail = TextEditingController();
  final ctlPassword = TextEditingController();
  final ctlConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              LocaleKeys.sozdat_novyi_akkaunt.tr(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 3,
                            offset: Offset(0, 0)),
                      ]),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: null,
                    labelColor: Colors.grey,
                    indicator: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
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
                const SizedBox(height: 40),
                Expanded(
                  child: TabBarView(children: [
                    Column(
                      children: [
                        IntlPhoneField(
                          controller: _phoneController,
                          initialCountryCode: 'KG',
                          onChanged: (phone) {},
                        ),
                        const SizedBox(height: 60),
                        ElevatedButton(
                          onPressed: () {
                            Routes.instance.push(
                                widget: const SendPinCodeScreen(),
                                context: context);
                          },
                          child: Text('Войти',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              primary: _signInFormKey == true
                                  ? Colors.blueGrey
                                  : Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(double.infinity, 50)),
                        ),
                      ],
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _key,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                child: TextFormField(
                                  controller: ctlLastName,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Фамилия'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                child: TextFormField(
                                  controller: ctlFirstName,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Имя',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                child: TextFormField(
                                  controller: ctlEmail,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Email'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                child: TextFormField(
                                  controller: ctlPassword,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Пароль'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                child: TextFormField(
                                  controller: ctlConfirmPassword,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Подтвердите пароль',
                                  ),
                                ),
                              ),
                              const SizedBox(
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
                                  onPressed: () async {
                                    if (ctlLastName.text.isNotEmpty &&
                                        ctlFirstName.text.isNotEmpty &&
                                        ctlEmail.text.isNotEmpty &&
                                        ctlPassword.text.isNotEmpty &&
                                        ctlConfirmPassword.text.isNotEmpty) {
                                      await RegisterService(
                                        remoteClient: RemoteClient(
                                          Client(),
                                          networkClient:
                                              NetworkClient(Connectivity()),
                                        ),
                                      ).registerAuth(
                                        context,
                                        userModel: UserModel(
                                          lastName: ctlLastName.text,
                                          firstName: ctlFirstName.text,
                                          email: ctlEmail.text,
                                          password: ctlPassword.text,
                                          passwordConfirm:
                                              ctlConfirmPassword.text,
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    LocaleKeys.voiti.tr(),
                                    style: const TextStyle(
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
                                style: const TextStyle(
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
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
