#import "GTKLabel.h"

@implementation GTKLabel

- (instancetype)initWithText:(const char*)str
{
    self = [super init];
    widget = gtk_label_new(str);
    return self;
}

- (void)dealloc
{
    //NSLog(@"GTKLabel deallocated!");

    [super dealloc];
}

- (void)setText:(const char*)str
{
    gtk_label_set_text((GtkLabel*)widget, str);
}

- (const char*)text
{
    return gtk_label_get_text((GtkLabel*)widget);
}

- (void)setMarkup:(const char*)str
{
    if(str != NULL)
        gtk_label_set_markup((GtkLabel*)widget, str);
}

- (void)setMarkupWithMnemonic:(const char*)str
{
    if(str != NULL)
        gtk_label_set_markup_with_mnemonic((GtkLabel*)widget, str);
}

- (GtkJustification)justify
{
    return gtk_label_get_justify((GtkLabel*)widget);
}

- (void)setJustify:(GtkJustification)jus
{
    gtk_label_set_justify((GtkLabel*)widget, jus);
}

- (float)xalign
{
    return gtk_label_get_xalign((GtkLabel*)widget);
}

- (void)setXalign:(float)align
{
    gtk_label_set_xalign((GtkLabel*)widget, align);
}

- (float)yalign
{
    return gtk_label_get_yalign((GtkLabel*)widget);
}

- (void)setYalign:(float)align
{
    gtk_label_set_yalign((GtkLabel*)widget, align);
}

- (PangoEllipsizeMode)ellipSize
{
    return gtk_label_get_ellipsize((GtkLabel*)widget);
}

- (void)setEllipSize:(PangoEllipsizeMode)mode
{
    gtk_label_set_ellipsize((GtkLabel*)widget, mode);
}

- (gint)widthInChars
{
    return gtk_label_get_width_chars((GtkLabel*)widget);
}

- (void)setWidthInChars:(gint)nChars
{
    gtk_label_set_width_chars((GtkLabel*)widget, nChars);
}

- (gint)maxWidthInChars
{
    return gtk_label_get_max_width_chars((GtkLabel*)widget);
}

- (void)setMaxWidthInChars:(gint)nChars
{
    gtk_label_set_max_width_chars((GtkLabel*)widget, nChars);
}

- (BOOL)isLineWrap
{
    return gtk_label_get_line_wrap((GtkLabel*)widget);
}

- (void)setIsLineWrap:(BOOL)b
{
    gtk_label_set_line_wrap((GtkLabel*)widget, b);
}

- (PangoWrapMode)lineWrapMode
{
    return gtk_label_get_line_wrap_mode((GtkLabel*)widget);
}

- (void)setLineWrapMode:(PangoWrapMode)mode
{
    gtk_label_set_line_wrap_mode((GtkLabel*)widget, mode);
}

- (gint)lines
{
    return gtk_label_get_lines((GtkLabel*)widget);
}

- (void)setLines:(gint)n
{
    gtk_label_set_lines((GtkLabel*)widget, n);
}

- (struct GTKPoint)layoutOffsets
{
    struct GTKPoint point;
    gtk_label_get_layout_offsets((GtkLabel*)widget, &point.x, &point.y);
    return point;
}

- (guint)mnemonicKeyValue
{
    return gtk_label_get_mnemonic_keyval((GtkLabel*)widget);
}

- (void)setUseMarkup:(BOOL)use
{
    gtk_label_set_use_markup((GtkLabel*)widget, use);
}

- (void)setUseUnderline:(BOOL)use
{
    gtk_label_set_use_underline((GtkLabel*)widget, use);
}

- (void)setSingleLineMode:(BOOL)b
{
    gtk_label_set_single_line_mode((GtkLabel*)widget, b);
}

- (void)setAngle:(double)angle
{
    gtk_label_set_angle((GtkLabel*)widget, angle);
}


@end



