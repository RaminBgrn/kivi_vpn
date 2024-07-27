import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_configs/controller/configs_controller.dart';
import 'package:kivi_vpn/features/feature_configs/widget/add_config_text.dart';
import 'package:kivi_vpn/features/feature_configs/widget/i_switch_button.dart';
import 'package:kivi_vpn/features/feature_configs/widget/qr_code_reader.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddConfigDialog {
  static final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  static late QRViewController? controller;

  static void addDialog() {
    // Get.to(QrCodeReader());
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        height: 360,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: disableButtonColor,
        ),
        child: Column(
          children: [
            const ISwitchButton(),
            ExpandablePageView(
              controller:
                  Get.find<ConfigsController>().getDialogPageViewController,
              children: const [
                AddConfigText(),
                // QrCodeReader(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
