#pragma once

#import "GTKWidget.h"


@interface GTKContainer : GTKWidget
{
@protected
    
    NSMutableDictionary *mWidgetDict;
}

@property (nonatomic, assign) GTKWidget* _Nullable focusChild;
@property (nonatomic, assign) guint borderWidth;

- (void)addWidget:(GTKWidget* _Nonnull)aWidget;
- (void)removeWidget:(GTKWidget* _Nonnull)aWidget;
- (BOOL)containsWidget:(GTKWidget* _Nonnull)aWidget;

@end



