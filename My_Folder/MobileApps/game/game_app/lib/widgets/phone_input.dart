import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// ignore: must_be_immutable
class PhoneInput extends StatefulWidget {
  PhoneInput({super.key, this.setPhoneNumber});
  void Function(String)? setPhoneNumber;
  @override
  // ignore: library_private_types_in_public_api
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'ET';
  PhoneNumber number = PhoneNumber(isoCode: 'ET');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            widget.setPhoneNumber!(number.phoneNumber ?? "");
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(color: Colors.black),
          initialValue: number,
          textFieldController: controller,
          formatInput: true,
          keyboardType: const TextInputType.numberWithOptions(
            signed: true,
            decimal: true,
          ),
          inputBorder: InputBorder.none,
          spaceBetweenSelectorAndTextField: 10,
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
      print("the second phone number is ${number.phoneNumber}");
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
