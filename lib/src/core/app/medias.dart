//svg data here...
const baseSVGPath = 'assets/svg/';

//image data here...
const baseImagePath = 'assets/images/';

//images
// final kOnboardingImage = _getImageBasePath('onboarding.png');
final kBanner1Image = _getImageBasePath('banner1.png');
final kBanner2Image = _getImageBasePath('banner2.png');
final kBanner3Image = _getImageBasePath('banner3.png');

final kBannerThreeImage = _getImageBasePath('banner_three.png');

//svg
final kHomeFilledSvg = _getSvgBasePath('home_filled.svg');
final kHomeOutlinedSvg = _getSvgBasePath('home_outline.svg');
final kPersonFilledSvg = _getSvgBasePath('person_filled.svg');
final kPersonOutlinedSvg = _getSvgBasePath('person_outline.svg');
final kHeartOutlinedSvg = _getSvgBasePath('heart_outline.svg');
final kHeartFilledSvg = _getSvgBasePath('heart_filled.svg');
final kReceiptFilledSvg = _getSvgBasePath('receipt_filled.svg');
final kReceiptOutlinedSvg = _getSvgBasePath('receipt_outline.svg');

//svg function here...
String _getSvgBasePath(String name) {
  return baseSVGPath + name;
}

//image function here...
String _getImageBasePath(String name) {
  return baseImagePath + name;
}
