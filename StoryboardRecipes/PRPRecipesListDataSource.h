//
//  PRPRecipesListDataSource.h
//  Recipes
//
//  Created by Owen on 2012-09-05.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PRPRecipe;

@protocol PRPRecipesListDataSource <NSObject>

- (NSInteger)recipeCount;
- (PRPRecipe *)recipeAtIndex:(NSInteger)index;
- (void)deleteRecipeAtIndex:(NSInteger)index;
- (PRPRecipe *)createNewRecipe;
- (void)recipesChanged;
- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe;

@end
