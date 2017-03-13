#import <React/RCTBridgeModule.h>
#import <TencentLBS/TencentLBS.h>

@interface RNTencentLBS : NSObject <RCTBridgeModule>

@property (readwrite, nonatomic, strong) TencentLBSLocationManager *locationManager;

@end
