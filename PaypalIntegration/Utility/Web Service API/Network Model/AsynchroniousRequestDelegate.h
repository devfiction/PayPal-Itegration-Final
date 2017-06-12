//
//  AsynchroniousRequestDelegate.h
//  Mesto
//
//  Created by Pawel Gajewski on 7/7/11.
//  Copyright 2011 Boris Venkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AsynchroniousRequest;

@protocol AsynchroniousRequestDelegate <NSObject>

- (void)request:(AsynchroniousRequest *)request didSucceedWithString:(NSData *)responseData;
- (void)request:(AsynchroniousRequest *)request didFailWithError:(NSError *)error;
- (void)request:(AsynchroniousRequest *)request didFailWithServerStatus:(NSInteger)status;

@end
