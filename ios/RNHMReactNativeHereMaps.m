#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTViewManager.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(RNHMReactNativeHereMaps, RCTViewManager)
    RCT_EXPORT_VIEW_PROPERTY(camera, NSDictionary)
    RCT_EXPORT_VIEW_PROPERTY(options, NSDictionary)
    RCT_EXPORT_VIEW_PROPERTY(mapStyle, NSDictionary)
    RCT_EXPORT_VIEW_PROPERTY(locationPicker, NSDictionary)
    RCT_EXPORT_VIEW_PROPERTY(markers, NSArray)
    RCT_EXPORT_VIEW_PROPERTY(polylines, NSArray)

    RCT_EXPORT_VIEW_PROPERTY(onMapReady, RCTDirectEventBlock)
    RCT_EXPORT_VIEW_PROPERTY(onCameraMove, RCTDirectEventBlock)
    RCT_EXPORT_VIEW_PROPERTY(onCameraMoveEnd, RCTDirectEventBlock)

    RCT_EXTERN_METHOD(setCamera:(nonnull NSNumber *)node location:(nonnull NSArray *)location)
    RCT_EXTERN_METHOD(setPadding:(nonnull NSNumber *)node padding:(nonnull NSArray *)padding)
    RCT_EXTERN_METHOD(setBounds:(nonnull NSNumber *)node bounds:(nonnull NSArray *)bounds)
    RCT_EXTERN_METHOD(getCameraPosition:(nonnull NSNumber *)node params:(nonnull NSArray *)params)
@end
