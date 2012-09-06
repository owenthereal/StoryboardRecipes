//
//  PRPViewController.m
//  Recipes
//
//  Created by Owen on 2012-09-04.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import "PRPViewController.h"

@interface PRPViewController ()

@end

@implementation PRPViewController

@synthesize recipe;
@synthesize recipeTitle;
@synthesize directionsView;
@synthesize prepTime;
@synthesize formatter;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.directionsView = nil;
    self.recipeTitle = nil;
    self.imageView = nil;
    self.prepTime = nil;
    self.formatter = nil;
    self.recipe = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.prepTime.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
    self.recipeTitle.text = self.recipe.title;
    self.directionsView.text = self.recipe.directions;
    if(nil != self.recipe.image) {
        self.imageView.image = self.recipe.image;
    }
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
