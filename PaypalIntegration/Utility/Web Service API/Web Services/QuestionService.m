//
//  QuestionService.m
//  PaypalIntegration
//
//  Created by Sweety Singh on 1/23/14.
//  Copyright (c) 2014 Paresh Bafna. All rights reserved.
//

#import "QuestionService.h"

@implementation QuestionService


-(id)init
{
    if ((self = [super init]))
    {
        
    }
    return self;
}

-(void)askQuestionwithName:(NSString *)name email:(NSString*)email andQuestion:(NSString *)question{
    
    AsynchroniousRequest *request = [[AsynchroniousRequest alloc] init];
    [request setDelegate:self];
    
    
    NSString * requestString=[NSString stringWithFormat:@"nombre=%@&email=%@pregunta=%@",name,email,question];
    
    NSString *ServiceURL=[NSString stringWithFormat:@"http://mobil.mo-bil.com.mx/cgi-bin/abogado-webservice.pl"];
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
    NSMutableDictionary *finalResultDictionary = [[NSMutableDictionary alloc] init];
    NSDictionary *subParentDictionary = [parentDictionary valueForKey:@"RESULTADOS"];
    
    
    for(NSString *key in [subParentDictionary allKeys])
    {
        NSDictionary *temp = [subParentDictionary valueForKey:key];
        if([temp valueForKey:@"text"])
            [finalResultDictionary setObject:[temp valueForKey:@"text"] forKey:key];
       
    }
    
    NSLog(@"Final result dict %@",finalResultDictionary);
    
    [delegate service:self DidFinishWithResult:finalResultDictionary];
}

@end
