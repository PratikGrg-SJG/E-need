//svg data here...
const baseSVGPath = 'assets/svg/';

//image data here...
const baseImagePath = 'assets/images/';

//json data here...
const baseJsonPath = 'assets/json/';

//network basepath
const baseNetworkPath = 'https://files.theyetilabs.com/agrotech/';

//images
// final kOnboardingImage = _getImageBasePath('onboarding.png');
final kFarmerGetStartedImage = _getImageBasePath('farmer_get_started.png');

final kBannerThreeImage = _getImageBasePath('banner_three.png');

//svg
final kHomeFilledSvg = _getSvgBasePath('home_filled.svg');
final kHomeOutlinedSvg = _getSvgBasePath('home_outline.svg');
final kPersonFilledSvg = _getSvgBasePath('person_filled.svg');
final kPersonOutlinedSvg = _getSvgBasePath('person_outline.svg');
final kHeartOutlinedSvg = _getSvgBasePath('heart_outline.svg');
final kHeartFilledSvg = _getSvgBasePath('heart_filled.svg');

//jsons
final kCountriesJson = _getJsonBasePath('countries.json');

//network image
final kOnboardingOneUrl = _getNetworkImageBasePath('onboarding_one.png');

//svg function here...
String _getSvgBasePath(String name) {
  return baseSVGPath + name;
}

//image function here...
String _getImageBasePath(String name) {
  return baseImagePath + name;
}

//json function here...
String _getJsonBasePath(String name) {
  return baseJsonPath + name;
}

String _getNetworkImageBasePath(String name) {
  return baseNetworkPath + name;
}
