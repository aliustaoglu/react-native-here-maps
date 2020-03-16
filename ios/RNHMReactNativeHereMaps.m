#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTViewManager.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(RNHMReactNativeHereMaps, RCTViewManager)
    RCT_EXPORT_VIEW_PROPERTY(camera, NSDictionary)
@end
