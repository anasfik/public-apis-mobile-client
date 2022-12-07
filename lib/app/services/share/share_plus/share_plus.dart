import 'package:public_apis_desktop_client/app/services/share/interfaces/share_text.dart';
import 'package:share_plus/share_plus.dart';

class ShareService implements ShareText {
  static final ShareService _instance = ShareService._();
  static ShareService get instance => _instance;
  ShareService._();

  @override
  Future shareText(String textToShare) async {
    ShareResult share = await Share.shareWithResult(textToShare);
    print(share.raw);
  }
}
