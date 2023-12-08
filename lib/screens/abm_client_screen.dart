import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../theme/custom_style_theme.dart';
import 'package:test_tots/helpers/validation_helper.dart';
import 'package:test_tots/models/client_model.dart';
import 'package:test_tots/providers/providers.dart';
import 'package:test_tots/widgets/custom_bottom_widget.dart';
import 'package:test_tots/widgets/custom_input_widget.dart';
import 'package:test_tots/widgets/upload_image_widget.dart';

class AbmClientScreen extends StatefulWidget {
  static String routeName = 'abmClient';
  final Client? client;
  const AbmClientScreen({Key? key, this.client}) : super(key: key);

  @override
  State<AbmClientScreen> createState() => _AbmClientScreenState();
}

class _AbmClientScreenState extends State<AbmClientScreen> {
  late final readAbmProvider = context.read<AbmClientProvider>();
  late final watchAbmProvider = context.watch<AbmClientProvider>();
  @override
  void initState() {
    if (widget.client == null) return;
    fillClient();
    super.initState();
  }

  void fillClient() {
    readAbmProvider.fillField(client: widget.client!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // width: double.infinity,
        // height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: readAbmProvider.myFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 20),
                            child: Text(
                              (widget.client == null)
                                  ? 'Add new client'
                                  : 'Update client',
                              style: const TextStyle(
                                  fontFamily:
                                      CustomStylesTheme.fontFamilyDMsans,
                                  fontSize: 17,
                                  fontWeight:
                                      CustomStylesTheme.fontWeightMedium,
                                  color: CustomStylesTheme.eerieBlackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Center(
                              child: UploadImageWidget(
                                  getFile: readAbmProvider.getCelula)),
                          // Center(
                          //   child: Image.asset(
                          //     'assets/img/upload_image.png',
                          //     width: 119,
                          //     height: 119,
                          //   ),
                          // ),
                          CustomInputWidget(
                            onTapOutside: (event) =>
                                readAbmProvider.focusNodeFirstName.unfocus(),
                            focusNode: readAbmProvider.focusNodeFirstName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: readAbmProvider.firtsNameController,
                            validator: ValidationHelper.onErrorFieldEmpty,
                            label: 'First name*',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomInputWidget(
                            onTapOutside: (event) =>
                                readAbmProvider.focusNodeLastName.unfocus(),
                            focusNode: readAbmProvider.focusNodeLastName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: readAbmProvider.lastNameController,
                            validator: ValidationHelper.onErrorFieldEmpty,
                            label: 'Last name*',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomInputWidget(
                            onTapOutside: (event) =>
                                readAbmProvider.focusNodeAdress.unfocus(),
                            focusNode: readAbmProvider.focusNodeAdress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: readAbmProvider.addressController,
                            validator: ValidationHelper.onErrorFieldEmpty,
                            label: 'Address*',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomInputWidget(
                            onTapOutside: (event) =>
                                readAbmProvider.focusNodeEmail.unfocus(),
                            focusNode: readAbmProvider.focusNodeEmail,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: readAbmProvider.emailController,
                            validator: ValidationHelper.onErrorEmail,
                            label: 'Mail*',
                          ),
                        ],
                      ),
                    ),
                    if (watchAbmProvider.isLoading)
                      const Center(
                        child: CircularProgressIndicator(
                          color: CustomStylesTheme.blackColor,
                        ),
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontFamily: CustomStylesTheme
                                              .fontFamilyDMsans,
                                          color:
                                              CustomStylesTheme.greyTextColor,
                                          fontSize: 14,
                                          fontWeight: CustomStylesTheme
                                              .fontWeightMedium),
                                    ))),
                          ),
                          Expanded(
                              flex: 2,
                              child: GestureDetector(
                                  onTap: () =>
                                      readAbmProvider.onSaved(context: context),
                                  child:
                                      const CustomButtomWidget(title: 'SAVE')))
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
