import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/devices/device_utils.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

class CountryPicker extends StatelessWidget {
  final ValueChanged<Country>? onChanged;

  const CountryPicker({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> favorite = ['CN'];
    final Rx<String> phoneCode = '86'.obs;

    void showCountryCodePicker(BuildContext context) {
      showCountryPicker(
        context: context,
        showPhoneCode: true,
        favorite: favorite,
        countryListTheme: CountryListThemeData(
          bottomSheetHeight: DeviceUtils.getScreenHeight() * 0.8,
          flagSize: UiSizes.iconMd,
          textStyle: FontStyles.labelLarge,
          searchTextStyle: FontStyles.labelLarge,
          inputDecoration: InputDecoration(
            prefixIcon: const Icon(Icons.language_rounded),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UiSizes.inputFieldPrimaryHeight),
              borderSide: BorderSide.none,
            ),
            hintText: UiTexts.loginSearchForACountryCodeOrName,
          ),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(UiSizes.bottomSheetRadius),
          ),
        ),
        onSelect: (country) {
          phoneCode.value = country.phoneCode;
          onChanged?.call(country);
        },
      );
    }

    return InkWell(
      onTap: () => showCountryCodePicker(context),
      child: SizedBox(
        height: double.infinity,
        child: IntrinsicWidth(
          child: Row(
            children: [
              const SizedBox(width: UiSizes.spaceBtwItems),
              Obx(
                () => RichText(
                  text: TextSpan(
                    text: '+',
                    style: context.textTheme.labelLarge!.copyWith(
                      color: context.colorExtension.textPrimary,
                    ),
                    children: [
                      const WidgetSpan(child: SizedBox(width: UiSizes.xs)),
                      TextSpan(text: phoneCode.value),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                color: context.colorExtension.textPrimary,
              ),
              const SizedBox(width: UiSizes.sm),
              Container(
                height: UiSizes.inputFieldPrimaryHeight / 3,
                width: UiSizes.dividerPrimaryThickness,
                color: context.colorExtension.iconSecondary,
              ),
              const SizedBox(width: UiSizes.sm),
            ],
          ),
        ),
      ),
    );
  }
}
