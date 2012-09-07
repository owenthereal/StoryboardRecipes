//
//  PRPRecipe.m
//  Recipes
//
//  Created by Owen on 2012-09-04.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import "PRPRecipe.h"

@implementation PRPRecipe

@synthesize title;
@synthesize directions;
@synthesize preparationTime;
@synthesize image;
@synthesize thumbnailImage;


- (id) init {
    self = [super init];
    if (self) {
        self.title = @"New Recipe";
    }    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:title forKey:@"title"];
    [coder encodeObject:directions forKey:@"directions"];
    [coder encodeObject:preparationTime forKey:@"preparationTime"];
    [coder encodeObject:image forKey:@"image"];
    [coder encodeObject:thumbnailImage forKey:@"thumbnailImage"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        title = [coder decodeObjectForKey:@"title"];
        directions = [coder decodeObjectForKey:@"directions"];
        preparationTime = [coder decodeObjectForKey:@"preparationTime"];
        image = [coder decodeObjectForKey:@"image"];
        thumbnailImage = [coder decodeObjectForKey:@"thumbnailImage"];
    }
    return self;
}

@end
