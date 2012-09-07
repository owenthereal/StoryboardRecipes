//
//  PRPRecipesListViewController.h
//  Recipes
//
//  Created by Owen on 2012-09-04.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListDataSource.h"
#import "PRPRecipeEditorDelegate.h"

@interface PRPRecipesListViewController : UITableViewController <PRPRecipeEditorDelegate>

@property(nonatomic, strong) id <PRPRecipesListDataSource> dataSource;

- (void)finishedEditingRecipe:(PRPRecipe *)recipe;

@end
