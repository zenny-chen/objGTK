#include <stdio.h>
#import "GTKApplication.h"
#import "GTKApplicationWindow.h"
#import "GTKFixed.h"
#import "GTKButton.h"


@interface AppDelegate : GTKObject<GTKApplicationDelegate, GTKWindowDelegate>
{
@private

    GTKApplicationWindow *mWindow;
    GTKFixed *mFixed;
}

@end


@implementation AppDelegate

- (void)dealloc
{
    [mWindow release];

    NSLog(@"AppDelegate deallocated!");

    [super dealloc];
}

- (BOOL)application:(GTKApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    NSLog(@"Application started!");

    mWindow = [[GTKApplicationWindow alloc] initWithApp:application];
    mWindow.title = "My Test";
    mWindow.defaultSize = (struct GTKSize){640, 480};
    [mWindow setInitPosition:GTK_WIN_POS_CENTER];
    mWindow.borderWidth = 8;
    mWindow.delegate = self;

    NSLog(@"The window ID is: %d", mWindow.windowID);

    mFixed = [GTKFixed new];
    [mWindow addWidget:mFixed];
    [mFixed release];

    GTKButton *button = [[GTKButton alloc] initWithLabel:"Button"];
    [button addClickEventWithTarget:self selector:@selector(buttonClicked:)];

    [mFixed putWidget:button atX:20 atY:40];
    [button release];

    button.size = (struct GTKSize){90, 30};

    NSLog(@"Does mFixed contains a button? %d", [mFixed containsWidget:button]);

    [mWindow showAll];

    return YES;
}

- (void)buttonClicked:(GTKButton*)button
{
    puts("Button clicked!!");
}

- (void)windowWillClose:(GTKWindow* _Nonnull)window
{
    NSLog(@"Window will be closed!!");
}

@end


int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [NSAutoreleasePool new];

    AppDelegate *appDelegate = [AppDelegate new];
    GTKApplication *application = [[GTKApplication alloc] initWithAppID:"com.greengames.testApp" flags:G_APPLICATION_FLAGS_NONE];
    application.delegate = appDelegate;

    [application runWithargc:argc argv:argv];

    [appDelegate release];
    [application release];

    [pool drain];
}



