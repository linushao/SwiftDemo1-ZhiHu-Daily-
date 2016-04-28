//
//  TopStories.h
//
//  Created by  linushao on 16/4/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TopStories : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double topStoriesIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *gaPrefix;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
