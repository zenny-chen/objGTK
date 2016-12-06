#pragma once

#import "GTKContainer.h"

@class GTKWindow;


@protocol GTKWindowDelegate <NSObject>

@optional

- (void)windowWillClose:(GTKWindow* _Nonnull)window;

@end


@interface GTKWindow: GTKContainer
{
@private

    id<GTKWindowDelegate> delegate;
}

@property (nonatomic, assign) id<GTKWindowDelegate> _Nullable delegate;
@property (nonatomic, assign) const char* _Nullable title;
@property (nonatomic, assign) BOOL isResizable;
@property (nonatomic, assign) BOOL isModal;
@property (nonatomic, assign) struct GTKSize defaultSize;
@property (nonatomic, assign) GdkGravity gravity;
@property (nonatomic, assign) struct GTKPoint position;
@property (nonatomic, assign) struct GTKSize size;
@property (nonatomic, readonly) BOOL isActive;
@property (nonatomic, readonly) BOOL isMaximized;
@property (nonatomic, assign) GTKWidget* _Nullable focus;

- (instancetype)initWithType:(GtkWindowType)type;
- (void)setupSignals;
- (void)setInitPosition:(GtkWindowPosition)pos;
- (BOOL)activateFocus;
- (BOOL)activateDefault;
- (void)present;

@end



