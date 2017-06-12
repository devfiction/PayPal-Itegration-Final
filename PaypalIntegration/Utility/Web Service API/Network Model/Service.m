//
//  Service.m
//  Mesto
//
//  Created by Pawel Gajewski on 7/15/11.
//  Copyright 2011 Boris Venkov. All rights reserved.
//

#import "Service.h"

@implementation Service

@synthesize delegate;

- (void)request
{
}


- (void)request:(AsynchroniousRequest *)request didSucceedWithString:(NSData *)responseData
{
    NSLog(@"inside request delegate in service");
    
}

- (void)request:(AsynchroniousRequest *)request didFailWithError:(NSError *)error
{
    currentRequest = nil;

    if (delegate) {
        [delegate service:self DidFailWithError:error];
    }
}

- (void)request:(AsynchroniousRequest *)request didFailWithServerStatus:(NSInteger)status
{
    currentRequest = nil;

    if (delegate) {
        [delegate service:self DidFailWithErrorCode:status];
    }
}

- (void)cancelServiceRequest
{
    if (nil != currentRequest) {
        [currentRequest cancelRequest];
        currentRequest = nil;
    }
}

@end
