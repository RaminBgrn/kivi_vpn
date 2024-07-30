import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/common/colors.dart';

import 'package:kivi_vpn/features/feature_configs/controller/configs_controller.dart';
import 'package:kivi_vpn/features/feature_configs/widget/config_item.dart';
import 'package:kivi_vpn/features/feature_configs/widget/empty_config_widget.dart';
import 'package:kivi_vpn/features/feature_configs/widget/home_draggable_header.dart';
import 'package:kivi_vpn/features/feature_configs/widget/home_draggable_title.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey[900],
      body: SafeArea(
        child: DraggableHome(
          appBarColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          headerExpandedHeight: 0.3,
          title: const HomeDraggableTitle(),
          headerWidget: const HomeDraggableHeader(),
          body: [
            GetBuilder<ConfigsController>(
              builder: (clr) {
                return clr.getConfigsList.isEmpty
                    ? const EmptyConfigWidget()
                    : ListView.builder(
                        itemCount: clr.getConfigsList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return ConfigItem(model: clr.getConfigsList[index]);
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
