#pragma once

#import "GTKWindow.h"

@class GTKApplication;

@interface GTKApplicationWindow : GTKWindow

@property (nonatomic, readonly) guint windowID;

- (instancetype)initWithApp:(GTKApplication*)app;

@end


