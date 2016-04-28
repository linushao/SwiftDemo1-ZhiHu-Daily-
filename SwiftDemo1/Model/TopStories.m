//
//  TopStories.m
//
//  Created by  linushao on 16/4/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TopStories.h"


NSString *const kTopStoriesId = @"id";
NSString *const kTopStoriesTitle = @"title";
NSString *const kTopStoriesImage = @"image";
NSString *const kTopStoriesType = @"type";
NSString *const kTopStoriesGaPrefix = @"ga_prefix";


@interface TopStories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopStories

@synthesize topStoriesIdentifier = _topStoriesIdentifier;
@synthesize title = _title;
@synthesize image = _image;
@synthesize type = _type;
@synthesize gaPrefix = _gaPrefix;


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
            self.topStoriesIdentifier = [[self objectOrNilForKey:kTopStoriesId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kTopStoriesTitle fromDictionary:dict];
            self.image = [self objectOrNilForKey:kTopStoriesImage fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kTopStoriesType fromDictionary:dict] doubleValue];
            self.gaPrefix = [self objectOrNilForKey:kTopStoriesGaPrefix fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topStoriesIdentifier] forKey:kTopStoriesId];
    [mutableDict setValue:self.title forKey:kTopStoriesTitle];
    [mutableDict setValue:self.image forKey:kTopStoriesImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kTopStoriesType];
    [mutableDict setValue:self.gaPrefix forKey:kTopStoriesGaPrefix];

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

    self.topStoriesIdentifier = [aDecoder decodeDoubleForKey:kTopStoriesId];
    self.title = [aDecoder decodeObjectForKey:kTopStoriesTitle];
    self.image = [aDecoder decodeObjectForKey:kTopStoriesImage];
    self.type = [aDecoder decodeDoubleForKey:kTopStoriesType];
    self.gaPrefix = [aDecoder decodeObjectForKey:kTopStoriesGaPrefix];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_topStoriesIdentifier forKey:kTopStoriesId];
    [aCoder encodeObject:_title forKey:kTopStoriesTitle];
    [aCoder encodeObject:_image forKey:kTopStoriesImage];
    [aCoder encodeDouble:_type forKey:kTopStoriesType];
    [aCoder encodeObject:_gaPrefix forKey:kTopStoriesGaPrefix];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopStories *copy = [[TopStories alloc] init];
    
    if (copy) {

        copy.topStoriesIdentifier = self.topStoriesIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.type = self.type;
        copy.gaPrefix = [self.gaPrefix copyWithZone:zone];
    }
    
    return copy;
}


@end
