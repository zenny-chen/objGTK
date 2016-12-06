#pragma once

#import "GTKObject.h"

#include <gtk/gtk.h>
#include <gdk/gdk.h>

#include <stdint.h>
#include <stdbool.h>


struct GTKPoint
{
    gint x, y;
};

struct GTKSize
{
    gint width, height;
};


@interface GTKWidget : GTKObject<NSCopying>
{
@protected

    GtkWidget *widget;
}

@property (nonatomic, readonly) GtkWidget* _Nullable widget;
@property (nonatomic, assign) const char* _Nullable name;
@property (nonatomic, assign) gint events;
@property (nonatomic, assign) struct GTKSize size;

- (void)retainWidget;
- (void)releaseWidget;
- (void)show;
- (void)hide;
- (void)showAll;
- (void)map;
- (void)unmap;
- (void)realize;
- (void)unrealize;
- (void)queueDraw;
- (void)queueResize;
- (void)queueResizeNoRedraw;
- (BOOL)activate;
- (BOOL)isFocus;
- (void)grabFocus;
- (void)grabDefault;

@end



