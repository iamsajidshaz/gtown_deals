import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _isGoogleSignInClicked = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool get isGoogleSignInClicked => _isGoogleSignInClicked;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setGoogleSignInClicked(bool value) {
    _isGoogleSignInClicked = value;
    notifyListeners();
  }
}
