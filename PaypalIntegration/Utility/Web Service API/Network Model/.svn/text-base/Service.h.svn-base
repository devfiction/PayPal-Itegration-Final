//
//  Service.h
//  Mesto
//
//  Created by Pawel Gajewski on 7/15/11.
//  Copyright 2011 Boris Venkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsynchroniousRequestDelegate.h"
#import "ServiceDelegate.h"
#import "AsynchroniousRequest.h"


@interface Service : NSObject <AsynchroniousRequestDelegate> {
    id<ServiceDelegate> delegate;
    AsynchroniousRequest *currentRequest;
}

@property (nonatomic, strong) id<ServiceDelegate> delegate;
@property (nonatomic, readwrite) int tag;

- (void)request;

- (void)request:(AsynchroniousRequest *)request didSucceedWithString:(NSData *)responseData;
- (void)request:(AsynchroniousRequest *)request didFailWithError:(NSString *)error;
- (void)request:(AsynchroniousRequest *)request didFailWithServerStatus:(NSInteger)status;
- (void)cancelServiceRequest;

@end
