import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';
import 'package:snapvids_app/common/widgets/space.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController countryCodeController;
  final TextEditingController phoneNumberController;
  final ValueChanged<Country>? onChangedCountryCode;
  final ValueChanged<String>? onChangedPhoneNumber;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const PhoneNumberField({
    super.key,
    required this.countryCodeController,
    required this.phoneNumberController,
    this.onChangedCountryCode,
    this.onChangedPhoneNumber,
    this.width,
    this.height,
    this.padding,
  });

  void _showCountryCodePicker(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['CN'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: MediaQuery.of(context).size.height * 0.8,
        flagSize: DesignVariables.sizeSmall,
        borderRadius: BorderRadius.circular(DesignVariables.borderRadiusLarge),
        inputDecoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.language,
          ),
          hintText: '搜索国家/地区代码或名称',
        ),
      ),
      onSelect: (country) {
        onChangedCountryCode?.call(country);
      },
    );
  }

  String? _countryCodeValidator(value) {
    if (value != '86') {
      return '仅支持中国大陆的手机号码';
    }
    return null;
  }

  String? _phoneNumberValidator(value) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: DesignVariables.spaceLarge),
      decoration: BoxDecoration(
        color: context.theme.gray_3,
        borderRadius: BorderRadius.circular(DesignVariables.borderRadiusMedium),
      ),
      child: Space(
        size: DesignVariables.spaceMedium,
        children: [
          IntrinsicWidth(
            child: TextFormField(
              controller: countryCodeController,
              onTap: () => _showCountryCodePicker(context),
              readOnly: true,
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.center,
              validator: _countryCodeValidator,
              decoration: const InputDecoration(
                isDense: true,
                prefixText: '+',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Container(width: 1, height: 16, color: context.theme.gray_5, child: null),
          Expanded(
            child: TextFormField(
              onChanged: (text) {
                onChangedPhoneNumber?.call(text);
              },
              maxLength: _phoneNumberLenMap[countryCodeController.text],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.center,
              validator: _phoneNumberValidator,
              controller: phoneNumberController,
              decoration: const InputDecoration(
                counterText: '',
                isDense: true,
                hintText: '请输入手机号码',
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const Map<String, int> _phoneNumberLenMap = {'86': 11};
