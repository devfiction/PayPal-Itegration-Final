//
//  ServiceDelegate.h
//  Mesto
//
//  Created by Pawel Gajewski on 7/14/11.
//  Copyright 2011 Boris Venkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Service;

@protocol ServiceDelegate <NSObject>

- (void)service:(Service *)service DidFinishWithResult:(id)result;
- (void)service:(Service *)service DidFailWithErrorCode:(NSInteger)error;
- (void)service:(Service *)service DidFailWithError:(NSError *)error;

@end
