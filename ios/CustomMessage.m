//
//  CustomMessage.m
//  reactdummy
//
//  Created by Kanika Gupta on 20/07/20.
//

//#import "CustomMessage.h"
//
//@implementation CustomMessage
//
//@end
#import "CustomMessage.h"
#import <React/RCTLog.h>

@implementation CustomMessage
// This RCT (React) “macro” exposes the current module to JavaScript
RCT_EXPORT_MODULE();
// We must explicitly expose methods otherwise JavaScript can’t access anything
RCT_EXPORT_METHOD(printMessage)
{
RCTLogInfo(@"Custom Message");
  [self showAlert];
}

// RCT_EXPORT_METHOD(showAlert){
 - (void)showAlert {
   dispatch_async(dispatch_get_main_queue(), ^{
       NSLog(@"inside dispatch async block main thread from main thread");
       UIWindow* topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
       topWindow.rootViewController = [UIViewController new];
       topWindow.windowLevel = UIWindowLevelAlert + 1;
      
       UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"APNS" message:@"received Notification" preferredStyle:UIAlertControllerStyleAlert];
      
       [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK",@"confirm") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
         // continue your work
        
         // important to hide the window after work completed.
         // this also keeps a reference to the window until the action is invoked.
         topWindow.hidden = YES; // if you want to hide the topwindow then use this
     //    topWindow = nil; // if you want to remove the topwindow then use this
       }]];
      
       [topWindow makeKeyAndVisible];
       [topWindow.rootViewController presentViewController:alert animated:YES completion:nil];

   });
 }
@end
