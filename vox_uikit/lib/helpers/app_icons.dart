import 'package:flutter/widgets.dart';

/// Для использования:
/// 1. Помести `AppIcons.ttf` в папку `fonts/`
/// 2. Добавь в `pubspec.yaml`:
///
/// flutter:
///   fonts:
///     - family: AppIcons
///       fonts:
///         - asset: fonts/AppIcons.ttf

class AppIcons {
  AppIcons._();

  static const _kFontFam = 'AppIcons';
  static const String _kFontPkg = 'vox_uikit';

  static const IconData arrowCollapse =
      IconData(0xe900, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrowExpand =
      IconData(0xe901, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrowDown =
      IconData(0xe902, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrowLeft =
      IconData(0xe903, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrowRight =
      IconData(0xe904, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrowUp =
      IconData(0xe905, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrowUpRightTiled =
      IconData(0xe906, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData attentionRoundedFilled =
      IconData(0xe907, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bookMarked =
      IconData(0xe908, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bookmarkFilled =
      IconData(0xe909, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bookmarkStroke =
      IconData(0xe90a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bookmarksTwinFilled =
      IconData(0xe90b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData calendarFilled =
      IconData(0xe90c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData calendarStroke =
      IconData(0xe90d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData catStroke =
      IconData(0xe90e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData check =
      IconData(0xe90f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData checkCurved =
      IconData(0xe910, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData checkMiniSingle =
      IconData(0xe911, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData checkMiniTween =
      IconData(0xe912, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData checkRibbedFilled =
      IconData(0xe913, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData checkRoundedFilled =
      IconData(0xe914, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData clockFilled =
      IconData(0xe915, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData copyStroke =
      IconData(0xe916, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cross =
      IconData(0xe917, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData crossRoundedFilled =
      IconData(0xe918, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData crossRoundedFilledMini =
      IconData(0xe919, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData dogStroke =
      IconData(0xe91a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData gpsMarkerStroke =
      IconData(0xe91b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData gpsNavigationStroke =
      IconData(0xe91c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData gpsPosition =
      IconData(0xe91d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heartFilled =
      IconData(0xe91e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heartStroke =
      IconData(0xe91f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData image =
      IconData(0xe920, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menuDots =
      IconData(0xe921, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menuSquares =
      IconData(0xe922, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData messageFilled =
      IconData(0xe923, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData messageStroke =
      IconData(0xe924, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData minus =
      IconData(0xe925, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData news =
      IconData(0xe926, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pawFilled =
      IconData(0xe927, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pawStroke =
      IconData(0xe928, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pencilDrawing =
      IconData(0xe929, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData phone =
      IconData(0xe92a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData plus =
      IconData(0xe92b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData questionRoundedFilled =
      IconData(0xe92c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData questionRoundedStroke =
      IconData(0xe92d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData rabbitStroke =
      IconData(0xe92e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search =
      IconData(0xe92f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData settings =
      IconData(0xe930, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData sexFemale =
      IconData(0xe931, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData sexMale =
      IconData(0xe932, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData share =
      IconData(0xe933, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData starFilled =
      IconData(0xe934, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData starStroke =
      IconData(0xe935, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData trashFilled =
      IconData(0xe936, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData userFilled =
      IconData(0xe937, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData userStroke =
      IconData(0xe938, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData healthCalendar =
      IconData(0xe939, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrowUpTiled =
      IconData(0xe93A, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData gpsMarkerFilled =
      IconData(0xe93B, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData gpsNavigationFilled =
      IconData(0xe93C, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData gpsRoute =
      IconData(0xe93D, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bellRingingStroke =
      IconData(0xe93E, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData addImage =
      IconData(0xe93F, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cameraStroke =
      IconData(0xe940, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
