import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:kivi_vpn/features/feature_edit_config/controller/edit_config_controller.dart';
import 'package:kivi_vpn/features/feature_edit_config/widgets/edit_confgi_text_input.dart';
import 'package:kivi_vpn/features/feature_edit_config/widgets/edit_header.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class EditConfigScreen extends StatefulWidget {
  final ConfigModel model;
  const EditConfigScreen({required this.model, super.key});

  @override
  State<EditConfigScreen> createState() => _EditConfigScreenState();
}

class _EditConfigScreenState extends State<EditConfigScreen> {
  late final EditConfigController _editController;

  @override
  void initState() {
    _editController = Get.find<EditConfigController>();
    _editController.initModel(widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
        backgroundColor: myGrey[900]!,
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const Gap(52),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Assets.svgs.cancel.svg(
                          height: 34,
                          width: 34,
                          colorFilter: ColorFilter.mode(
                            myRed[600]!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Text(
                        'ویرایش کانفیگ',
                        style: GoogleFonts.vazirmatn(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: myGrey[200]),
                      ),
                      GestureDetector(
                        onTap: () {
                          _editController.saveConfig();
                        },
                        child: Assets.svgs.save.svg(
                          height: 34,
                          width: 34,
                          colorFilter: ColorFilter.mode(
                            myGreen[600]!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const EditHeader(title: 'ویرایش فایل کانفیگ'),
                        const Gap(32),
                        EditConfigTextInput(
                          controller: _editController.getRemakeTextController,
                          title: "نام کانفیگ",
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: EditConfigTextInput(
                                controller:
                                    _editController.getPortTextController,
                                title: "پورت",
                                onlyDigit: true,
                              ),
                            ),
                            const Gap(12),
                            Expanded(
                              flex: 15,
                              child: EditConfigTextInput(
                                  controller:
                                      _editController.getAddressTextController,
                                  title: "آدرس"),
                            ),
                          ],
                        ),
                        const Gap(8),
                        EditConfigTextInput(
                          controller: _editController.getUUIDTextController,
                          title: "UUID",
                        ),
                        const Gap(8),
                        EditConfigTextInput(
                          controller: _editController.getAlterIdTextController,
                          title: "Alter Id",
                          onlyDigit: true,
                        ),
                        const Gap(8),
                        CustomDropdown<String>(
                            initialItem: _editController.getSecurity,
                            decoration: CustomDropdownDecoration(
                              prefixIcon: Text(
                                'Security',
                                style: GoogleFonts.vazirmatn(
                                    fontSize: 16, color: myGrey[400]),
                              ),
                              expandedSuffixIcon: Assets.svgs.arrowUp.svg(
                                  colorFilter: ColorFilter.mode(
                                myGrey[400]!,
                                BlendMode.srcIn,
                              )),
                              closedSuffixIcon: Assets.svgs.arrowDown.svg(
                                  colorFilter: ColorFilter.mode(
                                      myGrey[400]!, BlendMode.srcIn)),
                              expandedFillColor: myGrey[800],
                              headerStyle: GoogleFonts.vazirmatn(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: myGrey[200],
                              ),
                              listItemStyle: GoogleFonts.vazirmatn(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: myGrey[200],
                              ),
                              closedFillColor: Colors.transparent,
                              closedBorder: Border.all(
                                width: 1,
                                color: myGrey[500]!,
                              ),
                              closedBorderRadius: BorderRadius.circular(14),
                            ),
                            items: _editController.getSecurityList,
                            onChanged: (security) {
                              _editController
                                  .onSecurityChange(security ?? "none");
                            }),
                        const Gap(28),
                        const EditHeader(title: 'ویرایش Transport'),
                        const Gap(62),
                        Text(
                          'به‌زودی...',
                          style: GoogleFonts.vazirmatn(
                            fontSize: 42,
                            color: myGrey[500],
                          ),
                        )
                      ],
                    ),
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
