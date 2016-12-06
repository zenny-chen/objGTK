#pragma once

#import <Foundation/Foundation.h>

#ifndef __clang__

#define instancetype    id
#define _Nonnull
#define _Nullable

#endif


@interface GTKMessageWrapper : NSObject
{
@private

    NSObject *target;
    NSObject *param;

@public

    SEL selector;
}

@property (nonatomic, retain) NSObject* _Nullable target;
@property (nonatomic, retain) NSObject* _Nullable param;

@end


@interface GTKObject: NSObject

- (void)performSelectorOnMainThread:(SEL _Nonnull)aSelector withObject:(NSObject* _Nullable)param afterDelay:(NSTimeInterval)seconds;

@end


