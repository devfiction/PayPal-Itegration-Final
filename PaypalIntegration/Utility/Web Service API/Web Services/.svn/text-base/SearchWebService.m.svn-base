//
//  SearchWebService.m
//  PaypalIntegration
//
//  Created by Sweety Singh on 1/23/14.
//  Copyright (c) 2014 Paresh Bafna. All rights reserved.
//

#import "SearchWebService.h"


@implementation SearchWebService

-(void)getSearchResultWithName:(NSString *)name lastName:(NSString *)lastName companyName:(NSString *)company andEmail:(NSString *)email{
    
    AsynchroniousRequest *request = [[AsynchroniousRequest alloc] init];
    [request setDelegate:self];
    
    
    NSMutableString * requestString=[NSMutableString stringWithString:@""];;
    if (name != nil) {
        [requestString appendFormat:@"nombre=%@&",name];
    }if (lastName!=nil) {
        [requestString appendFormat:@"apellidos=%@&",lastName];
    }if (company != nil) {
        [requestString appendFormat:@"empresa=%@&",company];
    }
    [requestString appendFormat:@"email=%@",email];
    
    NSLog(@"requestStrng %@",requestString);
   // [NSString stringWithFormat:@"nombre=%@&apellidos=%@&empresa=%@&email=%@",name,lastName,company,email];
    
    NSString *ServiceURL=[NSString stringWithFormat:@"http://mobil.mo-bil.com.mx/cgi-bin/test-webservice.pl"];
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
    NSLog(@"%@",[subParentDictionary allKeys]);
    NSMutableDictionary *juciousDict = [[NSMutableDictionary alloc] init];
    NSMutableArray *juciosArray = [[NSMutableArray alloc] init];
    NSMutableArray *estadoArray= [[NSMutableArray alloc] init];
  
    
    
    for(NSString *key in [subParentDictionary allKeys])
    {
        if ([key isEqualToString: @"REGISTROS"]) {
            NSMutableDictionary *tempRegistroDict = [[NSMutableDictionary alloc] init];
            NSMutableDictionary *temp = [subParentDictionary valueForKey:key];
            NSLog(@"%@",[temp allKeys]);
            [temp removeObjectForKey:@"text"];
            NSMutableArray *tempjuiciosArray = [temp objectForKey:@"JUICIOS"];
            for (int i = 0; i < [tempjuiciosArray count]; i++) {
                NSMutableDictionary *tempDict = [tempjuiciosArray objectAtIndex:i];
                [tempDict removeObjectForKey:@"text"];
                
                for(NSString *key in [tempDict allKeys]){
                     NSDictionary *jDict = [tempDict valueForKey:key];
                    if([jDict valueForKey:@"text"])
                        [juciousDict setObject:[jDict valueForKey:@"text"] forKey:key];
                }
                [juciosArray addObject:juciousDict];
               
            }
             NSLog(@"jucios Array %@",juciosArray);
            
            NSMutableArray *tempestadoArray = [temp objectForKey:@"OP_ESTADO"];
            for (int i = 0; i <[tempestadoArray count]; i++) {
                NSDictionary *eDict = [tempestadoArray objectAtIndex:i];
                if([eDict valueForKey:@"text"])
                    
                    [estadoArray addObject:[eDict valueForKey:@"text"]];
            }
            NSLog(@"estado Array %@",estadoArray);
            [tempRegistroDict setObject:juciosArray forKey:@"JUICIOS"];
            [tempRegistroDict setObject:estadoArray forKey:@"OP_ESTADO"];
            NSLog(@"tempRegistroDict %@",tempRegistroDict);
            
            [finalResultDictionary setObject:tempRegistroDict forKey:key];
           
            
        }
        
        if ([key isEqualToString:@"NOMBRE"]) {
             NSMutableDictionary *temp = [subParentDictionary valueForKey:key];
            NSLog(@"NOMBREtemp %@",temp);
            if([temp valueForKey:@"text"])
                [finalResultDictionary setObject:[temp valueForKey:@"text"] forKey:key];
        }
        if ([key isEqualToString:@"GRADO_MAXIMO"]) {
             NSMutableDictionary *temp = [subParentDictionary valueForKey:key];
             NSLog(@"GRADO_MAXIMOtemp %@",temp);
            if([temp valueForKey:@"text"])
                [finalResultDictionary setObject:[temp valueForKey:@"text"] forKey:key];
        }
        if ([key isEqualToString:@"SEMAFORO"]) {
            NSMutableDictionary *tempSemaforoDit = [[NSMutableDictionary alloc] init];
            
             NSMutableDictionary *temp = [subParentDictionary valueForKey:key];
             NSLog(@"SEMAFORO temp %@",temp);
            [temp removeObjectForKey:@"text"];
            NSMutableArray *tempjuiciosArray = [temp objectForKey:@"JUICIOS"];
            for (int i = 0; i < [tempjuiciosArray count]; i++) {
                NSMutableDictionary *tempDict = [tempjuiciosArray objectAtIndex:i];
                [tempDict removeObjectForKey:@"text"];
                
                for(NSString *key in [tempDict allKeys]){
                    NSDictionary *jDict = [tempDict valueForKey:key];
                    if([jDict valueForKey:@"text"])
                        [juciousDict setObject:[jDict valueForKey:@"text"] forKey:key];
                }
                [juciosArray addObject:juciousDict];
                
            }
            NSLog(@"jucios Array %@",juciosArray);
            
            NSMutableArray *tempestadoArray = [temp objectForKey:@"OP_ESTADO"];
            for (int i = 0; i <[tempestadoArray count]; i++) {
                NSDictionary *eDict = [tempestadoArray objectAtIndex:i];
                if([eDict valueForKey:@"text"])
                    
                    [estadoArray addObject:[eDict valueForKey:@"text"]];
            }
            NSLog(@"estado Array %@",estadoArray);
            
            NSMutableArray *baseArray = [[NSMutableArray alloc] init];
            NSMutableArray *tempbaseArray = [temp objectForKey:@"BASE"];
            for (int i = 0; i <[tempbaseArray count]; i++) {
                NSDictionary *baseDict = [tempbaseArray objectAtIndex:i];
                if([baseDict valueForKey:@"text"])
                    
                    [baseArray addObject:[baseDict valueForKey:@"text"]];
            }
            [tempSemaforoDit setObject:baseArray forKey:@"BASE"];
            [tempSemaforoDit setObject:juciosArray forKey:@"JUICIOS"];
            [tempSemaforoDit setObject:estadoArray forKey:@"OP_ESTADO"];
            
            [finalResultDictionary setObject: tempSemaforoDit forKey:key];
           

        }
        
    }
    
    NSLog(@"Final result dict %@",finalResultDictionary);
    
    [delegate service:self DidFinishWithResult:finalResultDictionary];
}


@end
