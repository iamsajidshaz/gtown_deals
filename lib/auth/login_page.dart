import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final auth = AuthService();
    AppProvider appProvider = Provider.of<AppProvider>(context);
    //
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
            ),
            // logo
            Image.asset(
              'assets/images/app_logo.png',
              height: 206.h,
              width: 206.w,
            ),
            SizedBox(
              height: 84.h,
            ),
            // slogan
            Text(
              'BUY & SELL ONLINE, LOCALLY',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            // login button
            SizedBox(
              height: 290.h,
            ),
            GestureDetector(
              onTap: () async {
                appProvider.setGoogleSignInClicked(true);
                // google sign in
                await auth.loginWithGoogle();
                //
                appProvider.setGoogleSignInClicked(false);
              },
              child: Container(
                height: 50.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: appProvider.isGoogleSignInClicked
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Row(
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            Image.asset(
                              'assets/images/icon_google.png',
                              height: 40.h,
                              width: 40.w,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "Continue with Google Sign In",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 48.h,
            // ),
          ],
        ),
      ),
    );
  }
}
