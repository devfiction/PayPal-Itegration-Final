//
//  LogInAuthenticationService.m
//  Customer-Management
//
//  Created by komal on 3/1/13.
//  Copyright (c) 2013 Perennial. All rights reserved.
//

#import "TaxiWebService.h"
#import "XMLReader.h"




@implementation TaxiWebService

-(id)init
{
    if ((self = [super init]))
    {
       
    }
    return self;
}

- (void)request
{
    AsynchroniousRequest *request = [[AsynchroniousRequest alloc] init];
    [request setDelegate:self];
        
    
    NSString * soapRequestMesage=[NSString stringWithFormat:@"placa=A19705&nombre=Search"];
    
    NSString *ServiceURL=[NSString stringWithFormat:@"http://mobil.mo-bil.com.mx/cgi-bin/taxis-webservice.pl"];

    
   // [request requestURL:ServiceURL withPOSTParameters:soapRequestMesage withLength:length withAction:action];
    
    [request requestURL:ServiceURL withPOSTParameters:soapRequestMesage];
    currentRequest = request;
}


-(void)requestWithTaxiNumber:(NSString *)plate andNombre:(NSString *)nombre{
    
    AsynchroniousRequest *request = [[AsynchroniousRequest alloc] init];
    [request setDelegate:self];
    
    
    NSString * requestString=[NSString stringWithFormat:@"placa=%@&nombre=%@",plate,nombre];
    
    NSString *ServiceURL=[NSString stringWithFormat:@"http://mobil.mo-bil.com.mx/cgi-bin/taxis-webservice.pl"];
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
