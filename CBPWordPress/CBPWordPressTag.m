//
//  CBPWordPressTag.m
//  
//
//  Created by Karl Monaghan on 31/03/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPWordPressTag.h"

@implementation CBPWordPressTag

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    CBPWordPressTag *instance = [[CBPWordPressTag alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"post_count"]) {
        [self setValue:value forKey:@"postCount"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"tagId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}


- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.postCount] forKey:@"postCount"];

    if (self.slug) {
        [dictionary setObject:self.slug forKey:@"slug"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.tagId] forKey:@"tagId"];

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    return dictionary;
}

@end