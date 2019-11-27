#import "TextviewPlugin.h"
#if __has_include(<textview/textview-Swift.h>)
#import <textview/textview-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "textview-Swift.h"
#endif

@implementation TextviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTextviewPlugin registerWithRegistrar:registrar];
}
@end
