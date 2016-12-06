#import "GTKApplicationWindow.h"
#import "GTKApplication.h"

@implementation GTKApplicationWindow

- (instancetype)initWithApp:(GTKApplication*)app
{
    self = [super init];

    widget = gtk_application_window_new(app.app);
    [super setupSignals];

    return self;
}

- (guint)windowID
{
    return gtk_application_window_get_id((GtkApplicationWindow*)widget);
}

@end


