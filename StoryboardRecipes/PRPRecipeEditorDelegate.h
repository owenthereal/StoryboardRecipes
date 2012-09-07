//
//  PRPRecipeEditorDelegate.h
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-07.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PRPRecipe;

@protocol PRPRecipeEditorDelegate <NSObject>

- (void)finishedEditingRecipe:(PRPRecipe *)recipe;
- (void)recipeChanged:(PRPRecipe *)recipe;

@end
