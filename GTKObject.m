#import "GTKObject.h"
#include <stdbool.h>
#include <gtk/gtk.h>


@implementation GTKMessageWrapper

@synthesize target, param;

- (void)dealloc
{
    self.target = nil;
    self.param = nil;
    [super dealloc];
}

@end


static bool ObjCMessageTimerHandler(GTKMessageWrapper *message)
{
    NSAutoreleasePool *pool = [NSAutoreleasePool new];

    [message.target performSelector:message->selector withObject:message.param];
    [message release];
    
    [pool drain];

    return false;
}


@implementation GTKObject

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(NSObject*)param afterDelay:(NSTimeInterval)seconds;
{
    if(aSelector == NULL)
        return;

    size_t milliseconds = seconds * 1000.0;
    if(milliseconds < 1)
        milliseconds = 1;

    GTKMessageWrapper *msg = [GTKMessageWrapper new];
    msg.target = self;
    msg.param = param;
    msg->selector = aSelector;

    g_timeout_add(milliseconds, (GSourceFunc)&ObjCMessageTimerHandler, (gpointer)msg);
}

@end


