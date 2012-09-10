//
//  PRPRecipeEditorViewController.m
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-06.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import "PRPRecipeEditorViewController.h"
#import "PRPRecipe.h"

@interface PRPRecipeEditorViewController ()

@end

@implementation PRPRecipeEditorViewController

@synthesize recipe;
@synthesize titleField;
@synthesize directionsText;
@synthesize prepTimeLabel;
@synthesize recipeImage;
@synthesize prepTimeStepper;
@synthesize formatter;

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
	self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.formatter = nil;
    self.prepTimeStepper = nil;
    self.recipeImage = nil;
    self.prepTimeLabel = nil;
    self.directionsText = nil;
    self.titleField = nil;
    self.recipe = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.titleField.text = self.recipe.title;
    self.directionsText.text = self.recipe.directions;
    self.prepTimeLabel.text = [self.formatter
                               stringFromNumber:self.recipe.preparationTime];
    self.prepTimeStepper.value = [self.recipe.preparationTime doubleValue];
    if(nil != self.recipe.image) {
        self.recipeImage.image = self.recipe.image;
    }
}

- (IBAction)changePreparationTime:(UIStepper *)sender {
    NSInteger value = (NSInteger)[sender value];
    self.recipe.preparationTime = [NSNumber numberWithInteger:value];
    self.prepTimeLabel.text =
    [self.formatter stringFromNumber:self.recipe.preparationTime];
    [self.delegate recipeChanged:self.recipe];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.recipe.title = textField.text;
    [self.delegate recipeChanged:self.recipe];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([@"editDirections" isEqualToString:segue.identifier]) {
        [[segue destinationViewController] setText:self.recipe.directions];
        [[segue destinationViewController] setDelegate:self];
    }
    
    if([@"choosePhoto" isEqualToString:segue.identifier]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *originalImage =
    [info valueForKey:UIImagePickerControllerOriginalImage];
    
    CGSize cellViewSize = CGSizeMake(43.0, 43.0);
    CGRect cellViewRect = [self rectForImage:originalImage inSize:cellViewSize];
    UIGraphicsBeginImageContext(cellViewSize);
    [originalImage drawInRect:cellViewRect];
    self.recipe.thumbnailImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGSize detailImageSize = CGSizeMake(260.0, 260.0);
    CGRect detailImageRect = [self rectForImage:originalImage inSize:detailImageSize];
    UIGraphicsBeginImageContext(detailImageSize);
    [originalImage drawInRect:detailImageRect];
    self.recipe.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.delegate recipeChanged:self.recipe];
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
}

-
(CGRect)rectForImage:(UIImage *)image inSize:(CGSize)size {
    CGRect imageRect = {{0.0, 0.0}, image.size};
    CGFloat scale = 1.0;
    if(CGRectGetWidth(imageRect) > CGRectGetHeight(imageRect)) {
        scale = size.width / CGRectGetWidth(imageRect);
    }
    else{
        scale = size.height / CGRectGetHeight(imageRect);
    }
    
    CGRect rect = CGRectMake(0.0, 0.0,
                             scale * CGRectGetWidth(imageRect),
                             scale * CGRectGetHeight(imageRect));
    rect.origin.x = (size.width - CGRectGetWidth(rect)) / 2.0;
    rect.origin.y = (size.height - CGRectGetHeight(rect)) / 2.0;
    
    return rect;
}

- (IBAction)done:(UIBarButtonItem *)sender {
    [self dismissModalViewControllerAnimated:YES];
    [self.delegate finishedEditingRecipe:self.recipe];
}

- (void)directionsEditor:(PRPDirectionsEditorViewController *)editor
     finishedEditingText:(NSString *)text {
    self.recipe.directions = text;
    [self.delegate recipeChanged:self.recipe];
}

@end
