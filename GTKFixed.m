#import "GTKFixed.h"


@implementation GTKFixed

- (instancetype)init
{
    self = [super init];

    widget = gtk_fixed_new();

    return self;
}

/** Used for debug */
/**
- (void)dealloc
{
    NSLog(@"GTKFixed is deallocated!");
    [super dealloc];
}
*/

- (void)putWidget:(GTKWidget*)wid atX:(gint)x atY:(gint)y
{
    if(wid == nil)
        return;

    gtk_fixed_put((GtkFixed*)widget, wid.widget, x, y);

    NSValue *addr = [NSValue valueWithPointer:wid.widget];

    [mWidgetDict setObject:wid forKey:addr];
}

- (void)moveWidget:(GTKWidget*)wid atX:(gint)x atY:(gint)y
{
    if(wid == nil)
        return;

    gtk_fixed_move((GtkFixed*)widget, wid.widget, x, y);
}

@end


