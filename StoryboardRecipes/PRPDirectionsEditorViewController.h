//
//  PRPDirectionsEditorViewController.h
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-06.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPDirectionsEditorDelegate.h"

@class PRPRecipe;

@interface PRPDirectionsEditorViewController : UIViewController <UITextViewDelegate>

@property(nonatomic, copy) NSString *text;
@property(nonatomic, weak) id<PRPDirectionsEditorDelegate> delegate;

@end
