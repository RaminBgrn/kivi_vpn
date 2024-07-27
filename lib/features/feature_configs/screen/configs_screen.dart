import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kivi_vpn/common/colors.dart';

import 'package:kivi_vpn/features/feature_configs/controller/configs_controller.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:kivi_vpn/features/feature_configs/widget/add_config_dialog.dart';
import 'package:kivi_vpn/features/feature_configs/widget/config_item.dart';
import 'package:kivi_vpn/features/feature_configs/widget/empty_config_widget.dart';
import 'package:kivi_vpn/features/feature_configs/widget/home_draggable_header.dart';
import 'package:kivi_vpn/features/feature_configs/widget/home_draggable_title.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF080808),
        body: SafeArea(
          child: DraggableHome(
              appBarColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              headerExpandedHeight: 0.3,
              title: const HomeDraggableTitle(),
              headerWidget: const HomeDraggableHeader(),
              body: [
                GetBuilder<ConfigsController>(builder: (clr) {
                  return clr.getConfigsList.isEmpty
                      ? const EmptyConfigWidget()
                      : ListView.builder(
                          itemCount: clr.getConfigsList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return ConfigItem(
                                model: ConfigModel(
                                    address: '192.168.102.139',
                                    delay: '784',
                                    isSelected: index == 2 ? true : false,
                                    remake: "Ramin-Irancell"));
                          });
                }),
              ]),
        ));
  }
}
