#import "GTKButton.h"

@implementation GTKButton

static void PrivateButtonClickedEventHandler(GtkButton *widget, gpointer user_data)
{
    if(user_data == NULL)
        return;

    GTKButton *button = (GTKButton*)user_data;
    if(button->mClickTarget != nil && button->mClickSelector != NULL && [button->mClickTarget respondsToSelector:button->mClickSelector])
    {
        NSAutoreleasePool *pool = [NSAutoreleasePool new];

        [button->mClickTarget performSelector:button->mClickSelector withObject:button];

        [pool drain];
    }
}

- (instancetype)initWithLabel:(const char* _Nonnull)labelName
{
    self = [super init];

    if(labelName == NULL)
        widget = gtk_button_new();
    else
        widget = gtk_button_new_with_label(labelName);

    [self setupSignals];

    return self;
}

- (instancetype)initWithMnemonic:(const char* _Nonnull)label
{
    self = [super init];

    if(label == NULL)
        widget = gtk_button_new();
    else
        widget = gtk_button_new_with_mnemonic(label);

    [self setupSignals];

    return self;
}

- (void)dealloc
{
    self.image = nil;

    //NSLog(@"GTKButton is deallocated!");

    [super dealloc];
}

- (void)setupSignals
{
    g_signal_connect(widget, "clicked", G_CALLBACK(&PrivateButtonClickedEventHandler), self);
}

- (void)addClickEventWithTarget:(NSObject*)target selector:(SEL)selector
{
    mClickTarget = target;
    mClickSelector = selector;
}

- (void)click
{
    gtk_button_clicked((GtkButton*)widget);
}

- (void)setRelief:(GtkReliefStyle)rel
{
    gtk_button_set_relief((GtkButton*)widget, rel);
}

- (GtkReliefStyle)relief
{
    return gtk_button_get_relief((GtkButton*)widget);
}

- (void)setLabel:(const char*)lab
{
    gtk_button_set_label((GtkButton*)widget, lab);
}

- (const char*)label
{
    return gtk_button_get_label((GtkButton*)widget);
}

- (BOOL)isUnderlineUsed
{
    return gtk_button_get_use_underline((GtkButton*)widget);
}

- (void)setIsUnderlineUsed:(BOOL)b
{
    gtk_button_set_use_underline((GtkButton*)widget, b);
}

- (void)setImage:(GTKWidget*)img
{
    if(image != nil)
    {
        [image release];
        image = nil;
    }

    if(img != nil)
    {
        image = [img retain];
        gtk_button_set_image((GtkButton*)widget, img.widget);
    }
}

- (GTKWidget*)image
{
    return image;
}

- (GtkPositionType)imagePosition
{
    return gtk_button_get_image_position((GtkButton*)widget);
}

- (void)setImagePosition:(GtkPositionType)pos
{
    gtk_button_set_image_position((GtkButton*)widget, pos);
}

- (BOOL)doesAlwaysShowImage
{
    return gtk_button_get_always_show_image((GtkButton*)widget);
}

- (void)setDoesAlwaysShowImage:(BOOL)b
{
    gtk_button_set_always_show_image((GtkButton*)widget, b);
}

@end




