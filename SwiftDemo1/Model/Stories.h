//
//  Stories.h
//
//  Created by  linushao on 16/4/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Stories : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL multipic;
@property (nonatomic, assign) double storiesIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *gaPrefix;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
