//
//  Home.h
//
//  Created by  linushao on 16/4/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Home : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSArray *stories;
@property (nonatomic, strong) NSArray *topStories;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
