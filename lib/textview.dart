import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

typedef void TextViewCreated(TextViewController controller);

// Controller อันนี้สร้างไว้เพื่อที่จะทำให้เราสามารถควบคุม View ในฝั่ง Native ได้
class TextViewController {
  MethodChannel _channel;

  TextViewController(int id) {
    _channel = MethodChannel('me.intception.textview/$id');
  }

  // invokeMethod คืนค่าเป็น Future เราจึงต้องใส่ async ไว้ด้วย
  Future<void> setText(String newText) async {
    assert(newText != null);
    _channel.invokeMethod('setText', newText);
  }
}

class TextView extends StatefulWidget {
  final String defaultText;
  final Function onCreated;

  TextView(this.defaultText, {Key key, this.onCreated});

  @override
  _TextViewState createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  void onPlatFormViewCreated(int id) {
    if (widget.onCreated == null) {
      return;
    }
    widget.onCreated(TextViewController(id));
  }

  @override
  Widget build(BuildContext context) {
    // defaultTargetPlatform มาจาก library ที่ชื่อ foundation.dart
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: 'me.intception.textview',
          creationParamsCodec: StandardMessageCodec(),
          creationParams: widget.defaultText,
          onPlatformViewCreated: onPlatFormViewCreated,
        );
//      case TargetPlatform.iOS:
//        return UiKitView(
//          viewType: 'me.intception.textview',
//          creationParamsCodec: StandardMessageCodec(),
//          creationParams: widget.defaultText,
//          onPlatformViewCreated: onPlatFormViewCreated,
//        );
      default:
        return Text('$defaultTargetPlatform is not supported');
    }
  }
}
