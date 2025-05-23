/// Логические размеры экранов iPhone (portrait) для golden-тестов
/// Используются логические точки (points), а не физические пиксели.
/// Почему разрешение меньше: iOS и Flutter используют логические точки (points), чтобы интерфейс выглядел одинаково на устройствах с разной плотностью пикселей.
/// Например, если pixel ratio = 3, то 1 логическая точка = 3 физических пикселя.
/// Физические размеры экрана указаны в комментариях для справки.
/// Источник: https://wpexperts.io/blog/iphone-screen-size-and-resolution/ и https://www.appmysite.com/blog/the-complete-guide-to-iphone-screen-resolutions-and-sizes/
library;

class IphoneScreenSize {
  final String name;
  final double width;
  final double height;
  final double pixelRatio;

  const IphoneScreenSize(this.name, this.width, this.height, this.pixelRatio);
}

const iphoneScreenSizes = <IphoneScreenSize>[
  // iPhone 13 mini: 1080 x 2340 px, pixel ratio 3
  IphoneScreenSize('iPhone 13 mini', 360, 780, 3),
  // iPhone 13: 1170 x 2532 px, pixel ratio 3
  IphoneScreenSize('iPhone 13', 390, 844, 3),
  // iPhone 13 Pro: 1170 x 2532 px, pixel ratio 3
  IphoneScreenSize('iPhone 13 Pro', 390, 844, 3),
  // iPhone 13 Pro Max: 1284 x 2778 px, pixel ratio 3
  IphoneScreenSize('iPhone 13 Pro Max', 428, 926, 3),

  // iPhone 14: 1170 x 2532 px, pixel ratio 3
  IphoneScreenSize('iPhone 14', 390, 844, 3),
  // iPhone 14 Plus: 1284 x 2778 px, pixel ratio 3
  IphoneScreenSize('iPhone 14 Plus', 428, 926, 3),
  // iPhone 14 Pro: 1179 x 2556 px, pixel ratio 3
  IphoneScreenSize('iPhone 14 Pro', 393, 852, 3),
  // iPhone 14 Pro Max: 1290 x 2796 px, pixel ratio 3
  IphoneScreenSize('iPhone 14 Pro Max', 430, 932, 3),

  // iPhone 15: 1179 x 2556 px, pixel ratio 3
  IphoneScreenSize('iPhone 15', 393, 852, 3),
  // iPhone 15 Plus: 1290 x 2796 px, pixel ratio 3
  IphoneScreenSize('iPhone 15 Plus', 430, 932, 3),
  // iPhone 15 Pro: 1179 x 2556 px, pixel ratio 3
  IphoneScreenSize('iPhone 15 Pro', 393, 852, 3),
  // iPhone 15 Pro Max: 1290 x 2796 px, pixel ratio 3
  IphoneScreenSize('iPhone 15 Pro Max', 430, 932, 3),

  // iPhone 16: 1179 x 2556 px, pixel ratio 3
  IphoneScreenSize('iPhone 16', 393, 852, 3),
  // iPhone 16 Plus: 1290 x 2796 px, pixel ratio 3
  IphoneScreenSize('iPhone 16 Plus', 430, 932, 3),
  // iPhone 16 Pro: 1206 x 2622 px, pixel ratio 3
  IphoneScreenSize('iPhone 16 Pro', 402, 874, 3),
  // iPhone 16 Pro Max: 1320 x 2868 px, pixel ratio 3
  IphoneScreenSize('iPhone 16 Pro Max', 440, 956, 3),
  // iPhone 16e: 1170 x 2532 px, pixel ratio 3
  IphoneScreenSize('iPhone 16e', 390, 844, 3),
];
