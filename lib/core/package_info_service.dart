import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info_service.g.dart';

@Riverpod(keepAlive: true)
class PackageInfoService extends _$PackageInfoService {
  @override
  Future<String> build() async {
    return await getPackageInfo();
  }

  Future<String> getPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.version}+${packageInfo.buildNumber}';
  }
}
