//
//  AsynchroniousRequest.h
//  Mesto
//
//  Created by Pawel Gajewski on 7/7/11.
//  Copyright 2011 Boris Venkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsynchroniousRequestDelegate.h"
#import "ASIHTTPRequest.h"

@interface AsynchroniousRequest : NSObject {
    
    NSData *responseData;
    BOOL running;
    NSURLConnection *urlConnection;
    id<AsynchroniousRequestDelegate> delegate;
    
}

@property (retain, nonatomic) ASIHTTPRequest *request;
//@property (retain, nonatomic) ASIFormDataRequest *formrequest;
@property(nonatomic,strong) id<AsynchroniousRequestDelegate> delegate;

- (void)cancelRequest;
- (void)requestURL:(NSString *)url withPOSTParameters:(NSString *)params;
- (void)requestURL:(NSString *)url withPOSTParameters:(NSString *)params withLength:(NSString *)lengthObj withAction:(NSString *)actionObj;
@end
