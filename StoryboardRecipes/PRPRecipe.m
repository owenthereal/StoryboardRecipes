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


-(id) init {
    self = [super init];
    if (self) {
        self.title = @"New Receipe";
    }    
    return self;
}

@end
