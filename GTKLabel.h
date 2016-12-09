#pragma once

#import "GTKWidget.h"

@interface GTKLabel : GTKWidget

@property (nonatomic, assign) const char* _Nullable text;
@property (nonatomic, assign) GtkJustification justify;
@property (nonatomic, assign) float xalign;
@property (nonatomic, assign) float yalign;
@property (nonatomic, assign) PangoEllipsizeMode ellipSize;
@property (nonatomic, assign) gint widthInChars;
@property (nonatomic, assign) gint maxWidthInChars;
@property (nonatomic, assign) BOOL isLineWrap;
@property (nonatomic, assign) PangoWrapMode lineWrapMode;
@property (nonatomic, assign) gint lines;
@property (nonatomic, readonly) struct GTKPoint layoutOffsets;
@property (nonatomic, readonly) guint mnemonicKeyValue;

- (instancetype)initWithText:(const char* _Nullable)str;
- (void)setMarkup:(const char* _Nonnull)str;
- (void)setMarkupWithMnemonic:(const char* _Nonnull)str;
- (void)setUseMarkup:(BOOL)use;
- (void)setUseUnderline:(BOOL)use;
- (void)setSingleLineMode:(BOOL)b;
- (void)setAngle:(double)angle;


@end



