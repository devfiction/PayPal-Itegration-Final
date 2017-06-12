//
//  AsynchroniousRequest.m
//  Mesto
//
//  Created by Pawel Gajewski on 7/7/11.
//  Copyright 2011 Boris Venkov. All rights reserved.
//

#import "AsynchroniousRequest.h"
#import "Reachability.h"

static const NSTimeInterval kTimeout = 40;

@implementation AsynchroniousRequest

@synthesize delegate;

- (id)init
{
    self = [super init];
    
    if (self) {
        running = NO;
    }
    
    return self;
}

- (void)stopClean
{

    running = NO;
}

- (void)requestURL:(NSString *)url withPOSTParameters:(NSString *)params
{
    if (running != NO) {
        return;
    }
    running = YES;
  
    responseData = [[NSData alloc] init];

    if([self checkNetworkStatus])
    {
        self.request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:url]];
        [self.request appendPostData:[params dataUsingEncoding:NSUTF8StringEncoding]];
        [self.request setRequestMethod:@"POST"];
        [self.request setDelegate:self];
        [self.request setTimeOutSeconds:kTimeout];
        [self.request addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
        [self.request addRequestHeader:@"Accept" value:@"text/html,application/xhtml+xml,application/xml;"];
        [self.request setDidFailSelector:@selector(requestWentWrong:)];
        [self.request setDidFinishSelector:@selector(requestFinishedSuccessfully:)];
        
        [self.request startAsynchronous];
    }
    else
    {
        [delegate request:self didFailWithError:nil];
    }
       
}

-(void)requestWentWrong:(ASIHTTPRequest *)theRequest
{
    NSLog(@"failed ");
    NSError *error = [theRequest error];
    [delegate request:self didFailWithError:error];
}

-(void)requestFinishedSuccessfully:(ASIHTTPRequest *)theRequest
{
    NSLog(@"succes ");
   // NSString *responseString = [theRequest responseString];
    
    // Use when fetching binary data
    NSData *response = [theRequest responseData];
   // NSString * responsString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
   // NSLog(@"Received data \n %@",responsString);
    [delegate request:self didSucceedWithString:response];
}

- (void)cancelRequest
{
    [urlConnection cancel];
    [self stopClean];
    // Cancels an asynchronous request
//    [self.request cancel];
    
    // Cancels an asynchronous request, clearing all delegates and blocks first
//    [self.request clearDelegatesAndCancel];

}















- (void)requestURL:(NSString *)url withPOSTParameters:(NSString *)params withLength:(NSString *)lengthObj withAction:(NSString *)actionObj
{
    if (running != NO) {
        return;
    }
    running = YES;
    
    responseData = [NSMutableData data];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:lengthObj forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"text/html,application/xhtml+xml,application/xml;" forHTTPHeaderField:@"Accept"];
    
    
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:kTimeout];
    urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}


#pragma mark Connection delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
//    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
  //  NSInteger status = [httpResponse statusCode];
    
//    if (((status / 100) == 2)) {
//        //[responseData setLength:0];
//    } else {
//        [self cancelRequest];
//        [delegate request:self didFailWithServerStatus:status];
//    }
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    responseData = data;
   
   

}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self stopClean];
    [delegate request:self didFailWithError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

    //NSLog(@"inside connection did finish loading method");
      //NSLog(@"%@", [NSThread currentThread]);
    
     [delegate request:self didSucceedWithString:responseData];
    
  //  NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
  //  NSLog(@"response string=%@",responseString);
//   //NSLog(@"AsynchroniousRequest responceString>>>>>>>:%@",responseString);

    //[responseString autorelease];
    
    //[self.delegate request:self didSucceedWithString:responseString];
    
   // [delegate request:self didSucceedWithString:responseData];
    
     [self stopClean];
}







-(BOOL)checkNetworkStatus
{
    Reachability* reachability =  [Reachability reachabilityForInternetConnection];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    BOOL netework=FALSE;
    
    if(remoteHostStatus == NotReachable)
    {
        return NO;
    }
    else if (remoteHostStatus == ReachableViaWWAN) { netework=TRUE;}
    else if (remoteHostStatus == ReachableViaWiFi) { netework=TRUE;}
    
    if(netework==TRUE)
        return YES;
    else
        return NO;
}

@end
