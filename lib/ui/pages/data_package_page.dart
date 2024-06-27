import 'package:bank_pit_bwa/models/data_plan_model.dart';
import 'package:bank_pit_bwa/models/operator_car_model.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:bank_pit_bwa/ui/widgets/forms.dart';
import 'package:bank_pit_bwa/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;

  const DataPackagePage({
    Key? key,
    required this.operatorCard,
  }) : super(key: key);

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBlod,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            title: '+628',
            isShowTitle: false,
            controller: phoneController,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBlod,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: widget.operatorCard.dataPlans!.map((dataPlan) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDataPlan = dataPlan;
                  });
                },
                child: PackageItem(
                  dataPlan: dataPlan,
                  isSelected: dataPlan.id == selectedDataPlan?.id,
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
      floatingActionButton:
          (selectedDataPlan != null && phoneController.text.isNotEmpty)
              ? Container(
                  margin: const EdgeInsets.all(24),
                  child: CustomFilledButton(
                    title: "Continue",
                    onpressed: () {},
                  ),
                )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
