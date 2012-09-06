//
//  PRPRecipesSource.m
//  Recipes
//
//  Created by Owen on 2012-09-05.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import "PRPRecipesSource.h"
#import "PRPRecipe.h"

@interface PRPRecipesSource()

@property(nonatomic, strong) NSMutableArray *recipes;

@end

@implementation PRPRecipesSource

@synthesize recipes;

- (NSInteger)recipeCount {
    return [self.recipes count];
}

- (PRPRecipe *)recipeAtIndex:(NSInteger)index {
    return [self.recipes objectAtIndex:index];
}

- (void)deleteRecipeAtIndex:(NSInteger)index {
    [self.recipes removeObjectAtIndex:index];
}

- (NSArray *)recipes {
    if(nil == recipes) {
        NSMutableArray *localRecipes = [NSMutableArray array];
        PRPRecipe *recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"0 - Put some stuff in, and the other stuff, then stir"; recipe.title = @"0 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"IMG_1948.jpg"];
        recipe.preparationTime = [NSNumber numberWithInt:10];
        
        [localRecipes addObject:recipe];
        recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"1 - Put some stuff in, and the other stuff, then stir"; recipe.title = @"1 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"IMG_1948.jpg"];
        recipe.preparationTime = [NSNumber numberWithInt:20];
        
        [localRecipes addObject:recipe];
        self.recipes = localRecipes;
    }
    return recipes;
}

- (PRPRecipe *)createNewRecipe {
    PRPRecipe *recipe = [[PRPRecipe alloc] init];
    [self.recipes addObject:recipe];
    return recipe;
}

- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe {
    return [self.recipes indexOfObject:recipe];
}

@end
