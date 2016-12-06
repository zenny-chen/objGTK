#import "GTKWindow.h"


static void PrivateCloseWindowHandler(GtkWidget *widget, gpointer user_data)
{
    if(user_data == NULL)
        return;

    GTKWindow *window = (GTKWindow*)user_data;
    if(window.delegate != nil && [window.delegate respondsToSelector:@selector(windowWillClose:)])
    {
        NSAutoreleasePool *pool = [NSAutoreleasePool new];
        
        [window.delegate windowWillClose:window];

        [pool drain];
    }
}

@implementation GTKWindow

@synthesize delegate;

- (instancetype)initWithType:(GtkWindowType)type
{
    self = [super init];

    widget = gtk_window_new(type);
    [self setupSignals];

    return self;
}

- (void)setupSignals
{
    g_signal_connect(widget, "destroy", G_CALLBACK(&PrivateCloseWindowHandler), self);
}

- (void)setInitPosition:(GtkWindowPosition)pos
{
    gtk_window_set_position((GtkWindow*)widget, pos);
}

- (BOOL)activateFocus
{
    return gtk_window_activate_focus((GtkWindow*)widget);
}

- (BOOL)activateDefault
{
    return gtk_window_activate_default((GtkWindow*)widget);
}

- (void)present
{
    gtk_window_present((GtkWindow*)widget);
}

- (void)setTitle:(const char*)s
{
    gtk_window_set_title((GtkWindow*)widget, s);
}

- (const char*)title
{
    return gtk_window_get_title((GtkWindow*)widget);
}

- (void)setIsResizable:(BOOL)b
{
    gtk_window_set_resizable((GtkWindow*)widget, b);
}

- (BOOL)isResizable
{
    return gtk_window_get_resizable((GtkWindow*)widget);
}

- (void)setIsModal:(BOOL)b
{
    gtk_window_set_modal((GtkWindow*)widget, b);
}

- (BOOL)isModal
{
    return gtk_window_get_modal((GtkWindow*)widget);
}

- (void)setDefaultSize:(struct GTKSize)size
{
    gtk_window_set_default_size((GtkWindow*)widget, size.width, size.height);
}

- (struct GTKSize)defaultSize
{
    struct GTKSize size;
    gtk_window_get_default_size((GtkWindow*)widget, &size.width, &size.height);
    return size;
}

- (void)setGravity:(GdkGravity)g
{
    gtk_window_set_gravity((GtkWindow*)widget, g);
}

- (GdkGravity)gravity
{
    return gtk_window_get_gravity((GtkWindow*)widget);
}

- (void)setPosition:(struct GTKPoint)pos
{
    gtk_window_move((GtkWindow*)widget, pos.x, pos.y);
}

- (struct GTKPoint)position
{
    struct GTKPoint pos;
    gtk_window_get_position((GtkWindow*)widget, &pos.x, &pos.y);
    return pos;
}

- (void)setSize:(struct GTKSize)sz
{
    gtk_window_resize((GtkWindow*)widget, sz.width, sz.height);
}

- (struct GTKSize)size
{
    struct GTKSize sz;
    gtk_window_get_size((GtkWindow*)widget, &sz.width, &sz.height);
    return sz;
}

- (BOOL)isActive
{
    return gtk_window_is_active((GtkWindow*)widget);
}

- (BOOL)isMaximized
{
    return gtk_window_is_maximized((GtkWindow*)widget);
}

- (void)setFocus:(GTKWidget*)wid;
{
    if(wid == nil)
        return;

    gtk_window_set_focus((GtkWindow*)widget, wid.widget);
}

- (GTKWidget*)focus
{
    void *ptr = gtk_window_get_focus((GtkWindow*)widget);
    if(ptr == NULL)
        return nil;

    NSValue *addr = [NSValue valueWithPointer:ptr];

    GTKWidget *wid = [mWidgetDict objectForKey:addr];
    return wid;
}


@end



