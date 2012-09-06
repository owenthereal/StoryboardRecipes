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

@synthesize directionsView;
@synthesize prepTime;
@synthesize formatter;
@synthesize imageView;

@synthesize recipe;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.directionsView = nil;
    self.imageView = nil;
    self.prepTime = nil;
    self.formatter = nil;
    self.recipe = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.recipe.title;
    self.directionsView.text = self.recipe.directions;
    self.prepTime.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
    if(nil != self.recipe.image) {
        self.imageView.image = self.recipe.image;
    }
}

@end
