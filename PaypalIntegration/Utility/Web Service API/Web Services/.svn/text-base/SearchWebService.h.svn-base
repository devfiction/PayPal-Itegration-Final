//
//  SearchWebService.h
//  PaypalIntegration
//
//  Created by Sweety Singh on 1/23/14.
//  Copyright (c) 2014 Paresh Bafna. All rights reserved.
//

#import "Service.h"
#import "XMLReader.h"


@interface SearchWebService : Service<NSXMLParserDelegate>


-(void)getSearchResultWithName:(NSString *)name lastName:(NSString *)lastName companyName:(NSString *)company andEmail:(NSString *)email;
-(void)parseResponseDictionary:(NSDictionary *)parentDictionary;

@end
