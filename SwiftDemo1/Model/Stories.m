//
//  Stories.m
//
//  Created by  linushao on 16/4/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Stories.h"


NSString *const kStoriesMultipic = @"multipic";
NSString *const kStoriesId = @"id";
NSString *const kStoriesTitle = @"title";
NSString *const kStoriesType = @"type";
NSString *const kStoriesImages = @"images";
NSString *const kStoriesGaPrefix = @"ga_prefix";


@interface Stories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Stories

@synthesize multipic = _multipic;
@synthesize storiesIdentifier = _storiesIdentifier;
@synthesize title = _title;
@synthesize type = _type;
@synthesize images = _images;
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
            self.multipic = [[self objectOrNilForKey:kStoriesMultipic fromDictionary:dict] boolValue];
            self.storiesIdentifier = [[self objectOrNilForKey:kStoriesId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kStoriesTitle fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kStoriesType fromDictionary:dict] doubleValue];
            self.images = [self objectOrNilForKey:kStoriesImages fromDictionary:dict];
            self.gaPrefix = [self objectOrNilForKey:kStoriesGaPrefix fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.multipic] forKey:kStoriesMultipic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storiesIdentifier] forKey:kStoriesId];
    [mutableDict setValue:self.title forKey:kStoriesTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kStoriesType];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.images) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kStoriesImages];
    [mutableDict setValue:self.gaPrefix forKey:kStoriesGaPrefix];

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

    self.multipic = [aDecoder decodeBoolForKey:kStoriesMultipic];
    self.storiesIdentifier = [aDecoder decodeDoubleForKey:kStoriesId];
    self.title = [aDecoder decodeObjectForKey:kStoriesTitle];
    self.type = [aDecoder decodeDoubleForKey:kStoriesType];
    self.images = [aDecoder decodeObjectForKey:kStoriesImages];
    self.gaPrefix = [aDecoder decodeObjectForKey:kStoriesGaPrefix];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_multipic forKey:kStoriesMultipic];
    [aCoder encodeDouble:_storiesIdentifier forKey:kStoriesId];
    [aCoder encodeObject:_title forKey:kStoriesTitle];
    [aCoder encodeDouble:_type forKey:kStoriesType];
    [aCoder encodeObject:_images forKey:kStoriesImages];
    [aCoder encodeObject:_gaPrefix forKey:kStoriesGaPrefix];
}

- (id)copyWithZone:(NSZone *)zone
{
    Stories *copy = [[Stories alloc] init];
    
    if (copy) {

        copy.multipic = self.multipic;
        copy.storiesIdentifier = self.storiesIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.type = self.type;
        copy.images = [self.images copyWithZone:zone];
        copy.gaPrefix = [self.gaPrefix copyWithZone:zone];
    }
    
    return copy;
}


@end
