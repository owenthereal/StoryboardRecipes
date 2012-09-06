//
//  PRPRecipe.h
//  Recipes
//
//  Created by Owen on 2012-09-04.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRPRecipe : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *directions;
@property(nonatomic, strong) NSNumber *preparationTime;
@property(nonatomic, strong) UIImage *image;

@end
