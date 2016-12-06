#pragma once

#import "GTKContainer.h"

@interface GTKFixed : GTKContainer

- (void)putWidget:(GTKWidget* _Nonnull)wid atX:(gint)x atY:(gint)y;
- (void)moveWidget:(GTKWidget* _Nonnull)wid atX:(gint)x atY:(gint)y;

@end



