#import "RNTencentLBS.h"

@implementation RNTencentLBS


RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(configLocationManager:(NSString*)apiKey)
{
  // Your implementation here
    self.locationManager = [[TencentLBSLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
    [self.locationManager setApiKey:apiKey];
    [self.locationManager setRequestLevel:TencentLBSRequestLevelName];
    
    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
    if (authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

RCT_EXPORT_METHOD(startUpdatingLocation)
{
    [self.locationManager startUpdatingLocation];
}

RCT_EXPORT_METHOD(stopUpdatingLocation)
{
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - TencentLBSLocationManagerDelegate

- (void)tencentLBSLocationManager:(TencentLBSLocationManager *)manager
                 didFailWithError:(NSError *)error {
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    if (authorizationStatus == kCLAuthorizationStatusDenied || authorizationStatus == kCLAuthorizationStatusRestricted) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"定位权限未开启，是否开启？" preferredStyle:  UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if( [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]] ) {
#if  __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{}completionHandler:^(BOOL success) {
                }];
#elif __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
#endif
            }
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        
        
    } else {
    }
}

- (void)tencentLBSLocationManager:(TencentLBSLocationManager *)manager
                didUpdateLocation:(TencentLBSLocation *)location {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    fmt.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    NSString *dateString = [fmt stringFromDate:location.location.timestamp];
    
//    [self.displayLabel setText:[NSString stringWithFormat:@"%@\n %@\n latitude:%f, longitude:%f\n horizontalAccuracy:%f \n verticalAccuracy:%f\n speed:%f\n course:%f\n altitude:%f\n timestamp:%@\n", location.name, location.address, location.location.coordinate.latitude, location.location.coordinate.longitude, location.location.horizontalAccuracy, location.location.verticalAccuracy, location.location.speed, location.location.course, location.location.altitude, dateString]];
}

@end
