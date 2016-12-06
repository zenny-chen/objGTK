#import "GTKContainer.h"


@implementation GTKContainer

- (instancetype)init
{
    self = [super init];

    mWidgetDict = [[NSMutableDictionary alloc] initWithCapacity: 16];

    return self;
}

- (void)dealloc
{
    [mWidgetDict removeAllObjects];
    [mWidgetDict release];

    [super dealloc];
}

- (void)addWidget:(GTKWidget* _Nonnull)aWidget
{
    if(aWidget == nil)
        return;

    gtk_container_add((GtkContainer*)widget, aWidget.widget);

    NSValue *addr = [NSValue valueWithPointer:aWidget.widget];

    [mWidgetDict setObject:aWidget forKey:addr];
}

- (void)removeWidget:(GTKWidget* _Nonnull)aWidget
{
    if(aWidget == nil)
        return;

    NSValue *addr = [NSValue valueWithPointer:aWidget.widget];

    if([mWidgetDict objectForKey:addr] != nil)
    {
        gtk_container_remove((GtkContainer*)widget, aWidget.widget);
        [mWidgetDict removeObjectForKey:addr];
    }
}

- (GTKWidget*)focusChild
{
    void *ptr = gtk_container_get_focus_child((GtkContainer*)widget);
    if(ptr == NULL)
        return nil;

    NSValue *addr = [NSValue valueWithPointer:ptr];

    GTKWidget *obj = [mWidgetDict objectForKey:addr];
    return obj;
}

- (void)setFocusChild:(GTKWidget*)aWidget
{
    if(aWidget == nil)
        gtk_container_set_focus_child((GtkContainer*)widget, NULL);
    else
        gtk_container_set_focus_child((GtkContainer*)widget, aWidget.widget);
}

- (void)setBorderWidth:(guint)width
{
    gtk_container_set_border_width((GtkContainer*)widget, width);
}

- (guint)borderWidth
{
    return gtk_container_get_border_width((GtkContainer*)widget);
}

- (BOOL)containsWidget:(GTKWidget* _Nonnull)aWidget
{
    if(aWidget == nil)
        return NO;

    return [mWidgetDict.allValues containsObject:aWidget];
}

@end



