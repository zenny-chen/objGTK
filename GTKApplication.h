#pragma once

#include <gtk/gtk.h>

#import "GTKObject.h"


@class GTKApplication;

@protocol GTKApplicationDelegate <NSObject>

@optional

- (BOOL)application:(GTKApplication* _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary* _Nullable)launchOptions;

@end


@interface GTKApplication : GTKObject
{
@private

    GtkApplication *app;
    GTKObject<GTKApplicationDelegate> *delegate;
}

@property (nonatomic, readonly) GtkApplication *app;
@property (nonatomic, assign) GTKObject<GTKApplicationDelegate> * _Nullable delegate;

- (instancetype)initWithAppID:(const char* _Nullable)idStr flags:(GApplicationFlags)flags;

- (int)runWithargc:(int)argc argv:(char*[_Nullable])argv;

@end


