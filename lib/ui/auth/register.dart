import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/auth_controller.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/res/gaps.dart';
import 'package:workvn/ui/common_widgets/button.dart';
import 'package:workvn/ui/common_widgets/text_with_border.dart';
import 'package:workvn/ui/common_widgets/textfield.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController _authController = Get.find();
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff4568dc), Color(0xffb06ab3)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: TextWithBorder(
                      text: 'jobSeeker',
                      size: 70.0,
                      strokeWidth: 3,
                      fillColor: Colors.white,
                      borderColor: AppColor.lightBlue),
                ).pOnly(top: 130.0),
                Align(
                  alignment: Alignment.center,
                  child: TextWithBorder(
                      text: 'find your dream job',
                      size: 22.0,
                      strokeWidth: 3,
                      fillColor: Colors.white,
                      borderColor: AppColor.lightBlue),
                ),
                Gaps.vGap50,
                Gaps.vGap50,
                MyTextField(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColor.lightBlue,
                    ),
                    inputType: TextInputType.emailAddress,
                    controller: _emailController,
                    hintText: 'Địa chỉ email'),
                Gaps.vGap10,
                MyTextField(
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                      color: AppColor.lightBlue,
                    ),
                    inputType: TextInputType.name,
                    controller: _userNameController,
                    hintText: 'Tên hiển thị'),
                Gaps.vGap10,
                MyTextField(
                    prefixIcon: Icon(
                      Icons.vpn_key_outlined,
                      color: AppColor.lightBlue,
                    ),
                    inputType: TextInputType.visiblePassword,
                    controller: _pwController,
                    hintText: 'Mật khẩu',
                    isObscure: true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      child: 'Đăng kí'.text.color(AppColor.lightBlue).make(),
                      onPressed: () async {
                        if (_userNameController.text.isEmpty) {
                          Get.snackbar('Lỗi đăng kí tài khoản',
                              'Tên hiển thị không được để trống!');
                        } else {
                          await _authController
                              .signUp(_emailController.text, _pwController.text,
                                  _userNameController.text, context)
                              .then((value) async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('firstTime', false);
                          });
                        }
                      },
                    )
                  ],
                ).p(4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextWithBorder(
                      text: 'Đã có tài khoản? ',
                      size: 16.0,
                      strokeWidth: 1.5,
                      borderColor: Colors.black,
                    ),
                    CustomElevatedButton(
                        child:
                            'Đăng nhập'.text.color(AppColor.lightBlue).make(),
                        onPressed: () => Get.offAllNamed(SiteNavigation.LOGIN)),
                    TextWithBorder(
                      text: ' ngay.',
                      size: 16.0,
                      strokeWidth: 1.5,
                      borderColor: Colors.black,
                    ),
                  ],
                ).pOnly(top: 10.0),
              ],
            ).pSymmetric(h: 12.0),
          ),
        ),
      ),
    );
  }
}
