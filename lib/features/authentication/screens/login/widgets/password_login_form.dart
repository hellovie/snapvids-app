import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snapvids_app/common/widgets/common/space.dart';
import 'package:snapvids_app/entry_point.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';
import 'package:snapvids_app/utils/validators/validation.dart';

class PasswordLoginForm extends StatelessWidget {
  const PasswordLoginForm({
    super.key,
    required this.isAgree,
  });

  final Rx<bool> isAgree;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final Rx<bool> isPasswordObscured = true.obs;
    final Rx<TextEditingController> usernameController = TextEditingController().obs;
    final Rx<TextEditingController> passwordController = TextEditingController().obs;
    final Rx<TextEditingController> captchaController = TextEditingController().obs;

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
                onChanged: (value) {
                  // Todo(fix): The error message is cleared after changing the value.
                },
                validator: (value) => Validator.validateUsername(value),
                controller: usernameController.value,
                style: context.textTheme.labelLarge,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.user),
                  // Todo(fix): Unable to display icons.
                  suffixIcon: usernameController.value.text.isNotEmpty
                      ? const Icon(Iconsax.close_circle5)
                      : null,
                  hintText: UiTexts.loginUsernameInputFieldHint,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => TextFormField(
                validator: (value) => Validator.validatePassword(value),
                onChanged: (value) {
                  // Todo(fix): The error message is cleared after changing the value.
                },
                controller: passwordController.value,
                style: context.textTheme.labelLarge,
                obscureText: isPasswordObscured.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: InkWell(
                    onTap: () => isPasswordObscured.value = !isPasswordObscured.value,
                    child: isPasswordObscured.value
                        ? const Icon(Iconsax.eye)
                        : const Icon(Iconsax.eye_slash),
                  ),
                  hintText: UiTexts.loginPasswordInputFieldHint,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => TextFormField(
                validator: (value) => Validator.validateCaptcha(value),
                onChanged: (value) {
                  // Todo(fix): The error message is cleared after changing the value.
                },
                controller: captchaController.value,
                style: context.textTheme.labelLarge,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.check),
                  suffixIcon: SizedBox(
                    height: UiSizes.inputFieldPrimaryHeight,
                    child: IntrinsicWidth(
                      child: Row(
                        children: [
                          const SizedBox(width: UiSizes.sm),
                          Container(
                            height: UiSizes.inputFieldPrimaryHeight / 2,
                            width: UiSizes.dividerPrimaryThickness,
                            color: context.colorExtension.iconSecondary,
                          ),
                          const SizedBox(width: UiSizes.sm),
                          InkWell(
                            onTap: () => ToastHelper.show('敬请期待'),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(UiSizes.inputFieldPrimaryRadius),
                              ),
                              child: Image.memory(base64Decode(captchaPromptPlaceholder)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  hintText: UiTexts.loginCaptchaInputFieldHint,
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
                            ToastHelper.success('登录成功');
                            Get.offAll(const NavigationMenu());
                          } else {
                            // Todo: Validation failed.
                          }
                        }
                      : null,
                  child: const Text(UiTexts.loginVerifyAndLogin),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String captchaPromptPlaceholder =
    'iVBORw0KGgoAAAANSUhEUgAAAKoAAAA8CAIAAAB5K7aLAAAFZ0lEQVR42u2cv2sVQRDHH1jYBFKnMiooChYpUigopLAQrUTFSsWIgjY2WogGIoIYLAQr8R9QsbIwIP6oBMUgWCiBFJJSLIKgaQSfI6fHuXs7OzM7e7d775ZvYY7zMHy+8/PeczDsD3pOXf0F6upvN+gB54h/dXqtVI9/5E6P33M+nd8Z9fn7ln6C2mXfJ/+Rw6/IXh//pdVx0Cjgzz3uRwL/59tLoC6x7zv/EcJfIo/B/i/+/YvbQYn8wgt3Z0EJJv9N7xdBmXb4Pf4s8ceo9x1M/jNPX4G60foZvOkJQGCUTuEvlT5+F9TqddsBxAfSHfAf/h8frxfKGn8W0W/Q8pL2cpXViMH6htcg42rpg1zc0Az+WwsLUXMAwg+PbHFzUI8fd0OahmgGfzMOMHDuubIDtP7mGwgpFs21fgm6gYjfbhK5+EupeMUgV8vSwG+kihAH6LR+KbiBgt/uEGX4a93gEg7euAcH6W0Ykxj8WikWNn4Ddgj4Wvzim6uoDKPYIClDoDgBNDT4RXKDi27BPlLtZ+H3hq/9TFc5wEe7pPGHuIEYxA0M/XT8rjtrC3ZRAojdgG4CSGLtg7uBmK7Tx2/86IpmGzYx0Duy9ZO1Dkbyj8c+BL9xEf6MbH7EDaBw66d+vk7cBMVOD+OHtoCaxO81AR1/1QH0HY5WAmgT/92TL1TcUOCvJgAiftYU4IJHn/qQJ3gn+OLi4/u7QYoJoM3kD/jFDsCLBQU/dw50BT1ykYUfd0AVv3FnSAIYtMteywEGUUrrwN0E4Pi9pGuNUgWP86OvemoNtHzsCChR/FoOMJK/yw0qKz+8JSS6xJ76huT3QOU9Lx9OgnBnpIs/xuYHX/tQJ4sDY1Wxot/rnurGl7IdQhpABL+3BAyyyPzczQ+38xe4wWsLcY3g4sdzA/6EQbKhL1jRU/BTHmj7ABv5HLb4I1rfh5CrXRHmjT9G1efi55Z/ZKjDujzUGfRt/9Dx6SDZdig6fhyqAZ5VAhTxh+98WHO/eYWQMJBwp3yyrx38eFi74p5iAkrght/AXfnh6yDuyo9SSoj4KQtEJ/47k6cN6eKnLIKMH7PDL6j92Ge/aE0G6zCi3zaE7Q+jrhfwlg/uLEQs+a7mgEIuBn474XuXOeLbBP0dsZRET/5ec5Q+KMTNIrr4Bdt+3UDn4nct+LB/us8NmviR4IYrlOSBlwPd5M/Fr57nifi9+90QZA3h97Z4kAwMNzx4PgeqXlHBz83/ta0+i+v8YBdIBb99PRDZoEn29D4f3FDgr5YJSv6IhD8krGvxu5ZI9Pd4Kt/7bAe/ywSuv1vtGGxyE1PTIKI/WPi9Gx5x8veu/Cj4w6np44+6BARmdv9Y4veWdm7zETLjhWx8KSO+Pv6Ze+9AzYS+zD02WsMNBn7kXZHtD2/yiD30D63PeXpnv/bx1876kRIA/qLPyA2u9E5M/jYeSnEJGfqH0f4Tl4jJ3ybHNQE39Ikf1HEtGCh/l/hq39gHuAzh7Sq8+I9u3QxKEb+4vRcUjsBvaVUf4g19CjDkK3+sptJb0VvGf21lBSQIWeImQPfNb4wTUtHp+Bs429Y2goLwC5i5toG54KcgpOPMDD9xs0tMBtmFvjrCFvFLkr/d3svwaw0LeeHnfvU/5NwYfwbSb/28wGRbv0zZCyI4b/xD6Uc5cK+Azs1fAOWIX+yY1tM+A/+TE8dB4rbA2/SljP/s90egqBPEKOJXP2MXp0Dp40/qRHnfH1IUUsPf7dMy/nz7vh6/ji16Bt3HPzax11AHBr8e/7+6a9E1xCoK/Ukaf20oe5M/d4vQn44kf+KgOPv2MEjr4V8uz4GIN0+e+QAaQfy/AZYteYsVJ+3wAAAAAElFTkSuQmCC';
const String captchaFetchFailPlaceHolder =
    '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';
