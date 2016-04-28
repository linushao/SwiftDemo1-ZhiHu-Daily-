//
//  Home.m
//
//  Created by  linushao on 16/4/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Home.h"
#import "Stories.h"
#import "TopStories.h"


NSString *const kHomeDate = @"date";
NSString *const kHomeStories = @"stories";
NSString *const kHomeTopStories = @"top_stories";


@interface Home ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Home

@synthesize date = _date;
@synthesize stories = _stories;
@synthesize topStories = _topStories;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.date = [self objectOrNilForKey:kHomeDate fromDictionary:dict];
    NSObject *receivedStories = [dict objectForKey:kHomeStories];
    NSMutableArray *parsedStories = [NSMutableArray array];
    if ([receivedStories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedStories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedStories addObject:[Stories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedStories isKindOfClass:[NSDictionary class]]) {
       [parsedStories addObject:[Stories modelObjectWithDictionary:(NSDictionary *)receivedStories]];
    }

    self.stories = [NSArray arrayWithArray:parsedStories];
    NSObject *receivedTopStories = [dict objectForKey:kHomeTopStories];
    NSMutableArray *parsedTopStories = [NSMutableArray array];
    if ([receivedTopStories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTopStories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTopStories addObject:[TopStories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTopStories isKindOfClass:[NSDictionary class]]) {
       [parsedTopStories addObject:[TopStories modelObjectWithDictionary:(NSDictionary *)receivedTopStories]];
    }

    self.topStories = [NSArray arrayWithArray:parsedTopStories];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.date forKey:kHomeDate];
    NSMutableArray *tempArrayForStories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.stories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStories] forKey:kHomeStories];
    NSMutableArray *tempArrayForTopStories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topStories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopStories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopStories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopStories] forKey:kHomeTopStories];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.date = [aDecoder decodeObjectForKey:kHomeDate];
    self.stories = [aDecoder decodeObjectForKey:kHomeStories];
    self.topStories = [aDecoder decodeObjectForKey:kHomeTopStories];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_date forKey:kHomeDate];
    [aCoder encodeObject:_stories forKey:kHomeStories];
    [aCoder encodeObject:_topStories forKey:kHomeTopStories];
}

- (id)copyWithZone:(NSZone *)zone
{
    Home *copy = [[Home alloc] init];
    
    if (copy) {

        copy.date = [self.date copyWithZone:zone];
        copy.stories = [self.stories copyWithZone:zone];
        copy.topStories = [self.topStories copyWithZone:zone];
    }
    
    return copy;
}


@end
