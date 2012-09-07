//
//  PRPRecipeEditorViewController.h
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-06.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipeEditorDelegate.h"
#import "PRPDirectionsEditorDelegate.h"

@class PRPRecipe;

@interface PRPRecipeEditorViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate,                                      PRPDirectionsEditorDelegate>

@property(nonatomic, strong) PRPRecipe *recipe;

@property(nonatomic, strong) NSNumberFormatter *formatter;
@property(nonatomic, strong) IBOutlet UITextField *titleField;
@property(nonatomic, strong) IBOutlet UITextView *directionsText;
@property(nonatomic, strong) IBOutlet UILabel *prepTimeLabel;
@property(nonatomic, strong) IBOutlet UIImageView *recipeImage;
@property(nonatomic, strong) IBOutlet UIStepper *prepTimeStepper;

@property(nonatomic, weak) id<PRPRecipeEditorDelegate> delegate;

- (IBAction)done:(UIBarButtonItem *)sender;
- (IBAction)changePreparationTime:(UIStepper *)sender;

@end
