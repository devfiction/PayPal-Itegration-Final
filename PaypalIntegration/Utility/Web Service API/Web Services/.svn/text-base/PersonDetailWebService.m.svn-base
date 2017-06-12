//
//  PersonDetailWebService.m
//  PaypalIntegration
//
//  Created by Sweety Singh on 1/23/14.
//  Copyright (c) 2014 Paresh Bafna. All rights reserved.
//

#import "PersonDetailWebService.h"

@implementation PersonDetailWebService

-(id)init
{
    if ((self = [super init]))
    {
        
    }
    return self;
}




-(void)getPersonDetailWithFirstName:(NSString *)name andLastName:(NSString *)lastName{
    AsynchroniousRequest *request = [[AsynchroniousRequest alloc] init];
    [request setDelegate:self];
    
    
    NSString * requestString=[NSString stringWithFormat:@"nombre=%@&apellidos=%@",name,lastName];
    
    NSString *ServiceURL=[NSString stringWithFormat:@"http://mobil.mo-bil.com.mx/cgi-bin/cedulas-webservice.pl"];
    [request requestURL:ServiceURL withPOSTParameters:requestString];
    currentRequest = request;

}


- (void)request:(AsynchroniousRequest *)request didSucceedWithString:(NSData *)responseData
{
    
    NSString * responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Received data \n %@",responseString);
    responseString = [responseString stringByReplacingOccurrencesOfString:@"<?xml version\"1.0.\" enconding=\"UTF-8\"?>" withString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    currentRequest=nil;
    
    NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *xmlResponseDictionary = [XMLReader dictionaryForXMLData:data error:&error];
    NSLog(@"%@",xmlResponseDictionary);
    [self parseResponseDictionary:xmlResponseDictionary];
}




-(void)parseResponseDictionary:(NSDictionary *)parentDictionary
{
    NSMutableArray *finalresultArray= [[NSMutableArray alloc] init];
    NSMutableDictionary *finalResultDictionary = [[NSMutableDictionary alloc] init];
    NSDictionary *subParentDictionary = [parentDictionary valueForKey:@"RESULTADOS"];
    NSArray *resultArray = [subParentDictionary objectForKey:@"CEDULA"];
    for (int i = 0; i<[resultArray count]; i++) {
        NSMutableDictionary *temp = [resultArray objectAtIndex:i];
        [temp removeObjectForKey:@"text"];
        NSLog(@"allkeys %@",[temp allKeys]);
        
        for(NSString *key in [temp allKeys])
        {
            NSDictionary *tempDict = [temp valueForKey:key];
            if([tempDict valueForKey:@"text"])
                [finalResultDictionary setObject:[tempDict valueForKey:@"text"] forKey:key];
            
        }
        [finalresultArray addObject:finalResultDictionary];

    }
    
    
    NSLog(@"Final result dict %@",finalresultArray);
    
    [delegate service:self DidFinishWithResult:finalresultArray];
}
@end
