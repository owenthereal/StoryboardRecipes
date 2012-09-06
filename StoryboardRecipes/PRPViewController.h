//
//  PRPViewController.h
//  Recipes
//
//  Created by Owen on 2012-09-04.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipe.h"

@interface PRPViewController : UIViewController

@property(nonatomic, strong) PRPRecipe *recipe;
@property(nonatomic, strong) IBOutlet UILabel *recipeTitle;
@property(nonatomic, strong) IBOutlet UITextView *directionsView;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) IBOutlet UILabel *prepTime;
@property(nonatomic, strong) NSNumberFormatter *formatter;

- (IBAction)dismiss:(id)sender;

@end