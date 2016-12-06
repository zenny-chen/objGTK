#import "GTKApplication.h"

@implementation GTKApplication

@synthesize app, delegate;

- (instancetype)initWithAppID:(const char*)idStr flags:(GApplicationFlags)flags
{
    self = [super init];

    app = gtk_application_new(idStr, flags);

    return self;
}

- (void)dealloc
{
    g_object_unref(app);
    [super dealloc];
}

static void PrivateActivateHandler(GtkApplication *app, gpointer user_data)
{
    GTKApplication *application = user_data;
    if(application == nil || application.delegate == nil)
        return;

    if([application.delegate respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)])
    {
        NSAutoreleasePool *pool = [NSAutoreleasePool new];
        [application.delegate application:application didFinishLaunchingWithOptions:nil];
        [pool drain];
    }
}

- (int)runWithargc:(int)argc argv:(char*[])argv
{
    g_signal_connect(app, "activate", G_CALLBACK(&PrivateActivateHandler), self);

    return g_application_run(G_APPLICATION(app), argc, argv);
}

@end


