#import "GTKWidget.h"


@implementation GTKWidget

@synthesize widget;

- (instancetype)copyWithZone:(NSZone *)zone
{  
    return [self retain];
}

- (void)retainWidget
{
    g_object_ref(widget);
}

- (void)releaseWidget
{
    g_object_unref(widget);
}

- (void)show
{
    gtk_widget_show(widget);
}

- (void)hide
{
    gtk_widget_hide(widget);
}

- (void)showAll
{
    gtk_widget_show_all(widget);
}

- (void)map
{
    gtk_widget_map(widget);
}

- (void)unmap
{
    gtk_widget_unmap(widget);
}

- (void)realize
{
    gtk_widget_realize(widget);
}

- (void)unrealize
{
    gtk_widget_unrealize(widget);
}

- (void)queueDraw
{
    gtk_widget_queue_draw(widget);
}

- (void)queueResize
{
    gtk_widget_queue_resize(widget);
}

- (void)queueResizeNoRedraw
{
    gtk_widget_queue_resize_no_redraw(widget);
}

- (BOOL)activate
{
    return gtk_widget_activate(widget);
}

- (BOOL)isFocus
{
    return gtk_widget_is_focus(widget);
}

- (void)grabFocus
{
    gtk_widget_grab_focus(widget);
}

- (void)grabDefault
{
    gtk_widget_grab_default(widget);
}

- (void)setName:(const char*)s
{
    gtk_widget_set_name(widget, s);
}

- (const char*)name
{
    return gtk_widget_get_name(widget);
}

- (void)setEvents:(gint)evts
{
    gtk_widget_set_events(widget, evts);
}

- (gint)events
{
    return gtk_widget_get_events(widget);
}

- (struct GTKSize)size
{
    struct GTKSize sz;
    gtk_widget_get_size_request(widget, &sz.width, &sz.height);
    return sz;
}

- (void)setSize:(struct GTKSize)sz
{
    gtk_widget_set_size_request(widget, sz.width, sz.height);
}

@end



