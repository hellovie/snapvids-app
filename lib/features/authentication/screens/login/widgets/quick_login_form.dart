import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snapvids_app/common/widgets/common/space.dart';
import 'package:snapvids_app/features/authentication/screens/login/widgets/country_picker.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/validators/validation.dart';

class QuickLoginForm extends StatelessWidget {
  const QuickLoginForm({
    super.key,
    required this.isAgree,
  });

  final Rx<bool> isAgree;

  @override
  Widget build(BuildContext context) {
    final Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Space(
        direction: Axis.vertical,
        size: UiSizes.spaceBtwInputFields,
        children: [
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => TextFormField(
                controller: phoneNumberController.value,
                onChanged: (value) {
                  // Todo(fix): The error message is cleared after changing the value.
                },
                style: context.textTheme.labelLarge,
                keyboardType: TextInputType.number,
                validator: (value) => Validator.validatePhoneNumber(value),
                decoration: InputDecoration(
                  hintText: UiTexts.loginPhoneNumberInputFieldHint,
                  prefixIcon: SizedBox(
                    height: UiSizes.inputFieldPrimaryHeight,
                    child: IntrinsicWidth(
                      child: CountryPicker(onChanged: (country) {
                        phoneNumberController.value.clear();
                      }),
                    ),
                  ),
                  // Todo(fix): Unable to display icons.
                  suffixIcon: phoneNumberController.value.text.isNotEmpty
                      ? const Icon(Iconsax.close_circle5)
                      : null,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: IntrinsicHeight(
              child: Obx(
                () => ElevatedButton(
                  onPressed: isAgree.value
                      ? () {
                          if (formKey.currentState!.validate()) {
                            // Todo: Verification successful.
                            ToastHelper.success('发送成功');
                          } else {
                            // Todo: Validation failed.
                          }
                        }
                      : null,
                  child: const Text(UiTexts.loginSendSmsCaptcha),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
