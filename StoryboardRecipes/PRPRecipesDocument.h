//
//  PRPRecipesDocument.h
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-06.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListDataSource.h"

@interface PRPRecipesDocument : UIDocument <PRPRecipesListDataSource>

@property(nonatomic, strong) NSMutableArray *recipes;

- (void)addRecipesFromDocument:(PRPRecipesDocument *)newDoc;

@end
