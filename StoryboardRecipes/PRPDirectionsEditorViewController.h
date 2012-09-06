//
//  PRPDirectionsEditorViewController.h
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-06.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPRecipe;

@interface PRPDirectionsEditorViewController : UIViewController <UITextViewDelegate>

@property(nonatomic, strong) PRPRecipe *recipe;
@property(nonatomic, strong) IBOutlet UITextView *textView;

@end
