import 'package:mobile/helpers/local_helper.dart';
import 'package:mobile/models/signin_model.dart';
import 'package:path_provider/path_provider.dart';
import 'global_variable.dart';

Future<SigninModel?> getGlobal() async {
  SigninModel? account = await LocalHelper.getAccountFromLocal();
  currentUser = account;
  return account;
}

Future<void> loadPath() async {
  final dir = await getTemporaryDirectory();
  tempPath = dir.path;
  await deleteCacheDir();
}

Future<void> deleteCacheDir() async {
  final cacheDir = await getTemporaryDirectory();

  if (cacheDir.existsSync()) {
    cacheDir.deleteSync(recursive: true);
  }
}
