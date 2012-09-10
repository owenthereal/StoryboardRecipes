//
//  RecipeUnitTests.m
//  RecipeUnitTests
//
//  Created by Owen on 2012-09-08.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import "RecipeUnitTests.h"
#import "PRPRecipesDocument.h"
#import "PRPRecipe.h"

@implementation RecipeUnitTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void) testPersistence {
    NSURL *docDir = [[[NSFileManager defaultManager]
                      URLsForDirectory:NSDocumentDirectory
                      inDomains:NSUserDomainMask] lastObject];
    NSURL *docURL = [docDir URLByAppendingPathComponent:@"Recipes.recipes"];
    PRPRecipesDocument *recipesDocForSaving =
    [[PRPRecipesDocument alloc] initWithFileURL:docURL];
    PRPRecipe *recipeToSave = [recipesDocForSaving createNewRecipe];
    STAssertNotNil(recipeToSave, @"Failed to create recipe from document");
    
    recipeToSave.title = NSLocalizedString(@"Nachos", nil);
    recipeToSave.directions = NSLocalizedString( @"Open bag\nOpen jar of salsa\nEnjoy", nil);
    recipeToSave.preparationTime = [NSNumber numberWithInt:1];
    [recipesDocForSaving recipesChanged];
    [recipesDocForSaving closeWithCompletionHandler:^(BOOL success) {
        STAssertTrue(success, @"failed to save recipes doc"); }];
    [[NSRunLoop currentRunLoop] runUntilDate:
     [NSDate dateWithTimeIntervalSinceNow:2.0]];
    
    PRPRecipesDocument *recipesDocForLoading = [[PRPRecipesDocument alloc]
                                                initWithFileURL:docURL];
    [recipesDocForLoading openWithCompletionHandler:^(BOOL success) {
        STAssertTrue(success, @"failed to open recipesDocForLoading");
       
        NSInteger recipeCount = [recipesDocForLoading recipeCount] ;
        STAssertEquals(recipeCount, 1, @"Wrong number of recipes: %d", recipeCount);
        
        PRPRecipe *recipeToLoad = [recipesDocForLoading recipeAtIndex:0];
        STAssertNotNil(recipeToLoad, @"Couldn't load first recipe");
        
        if (! [recipeToLoad.title isEqualToString:NSLocalizedString(@"Nachos", nil)]) {
            STFail (@"First recipe has wrong title: %@", recipeToLoad.title);
        }
    }];
    [[NSRunLoop currentRunLoop] runUntilDate:
     [NSDate dateWithTimeIntervalSinceNow:2.0]];
}


@end
