//
//  PRPDirectionsEditorViewController.m
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-06.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import "PRPDirectionsEditorViewController.h"
#import "PRPRecipe.h"

@interface PRPDirectionsEditorViewController ()

@end

@implementation PRPDirectionsEditorViewController

@synthesize recipe;
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.recipe.directions = self.textView.text;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Edit Directions";
    [self.textView becomeFirstResponder];
    self.textView.text = self.recipe.directions;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.textView resignFirstResponder];
}

@end
