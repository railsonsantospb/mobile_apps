#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
//@import Firebase;
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //[FIRApp configure];

    FlutterViewController *controller = (FlutterViewController *) self.window.rootViewController;
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"MyChannel" binaryMessenger:controller];

    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        NSString *from = call.arguments[@"from"];
        if([@"myNativeFunction" isEqualToString:call.method]){
            NSString *messageToFlutter = [self myNativeFunction];
            messageToFlutter = [NSString stringWithFormat:@"%@, Back to %@", messageToFlutter, from];
            result(messageToFlutter);
        }
    }];

    [GMSServices provideAPIKey:@"AIzaSyDfK4dQdfjRM-4TBsUvX4dj-p31oZf-0JU"];
    [GeneratedPluginRegistrant registerWithRegistry:self];

    
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

-(NSString *) myNativeFunction{
    return @"Message from iOS";
}

@end
