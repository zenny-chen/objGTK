#pragma once

#import "GTKContainer.h"

@interface GTKButton : GTKContainer
{
@private

    GTKWidget *image;

@protected

    NSObject *mClickTarget;
    SEL mClickSelector;
}

@property (nonatomic, assign) GtkReliefStyle relief;
@property (nonatomic, assign) const char* _Nullable label;
@property (nonatomic, assign) BOOL isUnderlineUsed;
@property (nonatomic, retain) GTKWidget* _Nullable image;
@property (nonatomic, assign) GtkPositionType imagePosition;
@property (nonatomic, assign) BOOL doesAlwaysShowImage;

- (instancetype)initWithLabel:(const char* _Nonnull)labelName;
- (instancetype)initWithMnemonic:(const char* _Nonnull)label;
- (void)setupSignals;
- (void)addClickEventWithTarget:(NSObject* _Nonnull)target selector:(SEL _Nonnull)selector;
- (void)click;

@end


