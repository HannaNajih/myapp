import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final GetStorage _getbox = GetStorage();
  final _key = 'isDarkMode';
  _saveThemeBox(bool isDarkMode) {
    return _getbox.write(_key, isDarkMode);
  } //lera aw theme ay ka hamana ba paireke key w value boman save akat kate ka gorankary la

  //theme akain la kate darchun w hatnanawaway user bo naw appaka
  bool _loadThemeFromGetBox() {
    return _getbox.read<bool>(_key) ??
        false; //lera la yakamrun bun xoy nulla,boya abe xoman valuey bayne takw null retun nakat
  }

  ThemeMode get theme =>
      _loadThemeFromGetBox() ? ThemeMode.dark : ThemeMode.light;
  //am objecty theme ka drwstan krdwa bo awaya ka la property themeMode y GetMaterialAppakada bangy kainawa
  //ka peman le aya darka yan light
  switchTheme() {
    Get.changeThemeMode(
        _loadThemeFromGetBox() ? ThemeMode.dark : ThemeMode.light);
    _saveThemeBox(
        !_loadThemeFromGetBox()); //lera ema tanha dw agarman haya, dark yan light
    //boya agar har kamian bw 3aksakai bhenawa bo am goryna ka lam functionada rw dadat
  }
}
