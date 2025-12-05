import 'package:fruits_hub/core/utils/app_images.dart';

class BottomNavigationBarEnitiy {
  final String label;
  final String activeIconPath;
  final String inactiveIconPath;

  BottomNavigationBarEnitiy(
      {required this.label,
      required this.activeIconPath,
      required this.inactiveIconPath});
}

List<BottomNavigationBarEnitiy> bottomNavigationBarItems = [
  BottomNavigationBarEnitiy(
      label: 'الرئيسية',
      activeIconPath: Assets.assetsImagesHomeActive,
      inactiveIconPath: Assets.assetsImagesHomeInactive),
  BottomNavigationBarEnitiy(
      label: 'المنتجات',
      activeIconPath: Assets.assetsImagesProductActive,
      inactiveIconPath: Assets.assetsImagesProductInactive),
  BottomNavigationBarEnitiy(
      label: 'سلة التسوق',
      activeIconPath: Assets.assetsImagesShoppingCartActive,
      inactiveIconPath: Assets.assetsImagesShoppingCartInactive),
  BottomNavigationBarEnitiy(
      label: 'حسابي',
      activeIconPath: Assets.assetsImagesUserActive,
      inactiveIconPath: Assets.assetsImagesUserInactive),
];
