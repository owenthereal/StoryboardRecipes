//
//  PRPRecipesDocument.m
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-06.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import "PRPRecipesDocument.h"
#import "PRPRecipe.h"

NSString * const PRPRecipesDidChangeNotification = @"PRPRecipesDidChangeNotification";

@implementation PRPRecipesDocument

- (id)initWithFileURL:(NSURL *)url {
    self = [super initWithFileURL:url];
    if (self) {
        self.recipes = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)recipeCount {
    return [self.recipes count];
}

- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe {
    return [self.recipes indexOfObject:recipe];
}

- (PRPRecipe *)recipeAtIndex:(NSInteger)index {
    return [self.recipes objectAtIndex:index];
}

- (void)deleteRecipeAtIndex:(NSInteger)index {
    [self.recipes removeObjectAtIndex:index];
    [self recipesChanged];
}

- (PRPRecipe *)createNewRecipe {
    PRPRecipe *recipe = [[PRPRecipe alloc] init];
    [self.recipes addObject:recipe];
    [self recipesChanged];
    return recipe;
}

- (void)recipesChanged {
    [self updateChangeCount:UIDocumentChangeDone];
}

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError {
    return [NSKeyedArchiver archivedDataWithRootObject:self.recipes];
}

- (BOOL)loadFromContents:(id)contents
                  ofType:(NSString *)typeName
                   error:(NSError **)outError {
    BOOL success = NO;
    if([contents isKindOfClass:[NSData class]] && [contents length] > 0) {
        NSData *data = (NSData *)contents;
        self.recipes = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        success = YES;
        
    }
    return success;
}

- (void)handleError:(NSError *)error
userInteractionPermitted:(BOOL)userInteractionPermitted {
    if([[error domain] isEqualToString:NSCocoaErrorDomain] &&
       [error code] == NSFileReadNoSuchFileError) {
        [self saveToURL:[self fileURL]
       forSaveOperation:UIDocumentSaveForCreating
      completionHandler:^(BOOL success) {
          // ignore it here, we just wanted to make sure the document is created
          NSLog(@"handled open error with a new doc"); }];
    } else {
        // if it's not a NSFileReadNoSuchFileError just call super
        [super handleError:error
  userInteractionPermitted:userInteractionPermitted];
    }
}

- (NSData *)dataForRecipes:(NSError **)error {
    __block NSData *data = nil;
    NSFileCoordinator *coordinator = [[NSFileCoordinator alloc]
                                      initWithFilePresenter:nil];
    [coordinator coordinateReadingItemAtURL:[self fileURL]
                                    options:NSFileCoordinatorReadingWithoutChanges
                                      error:error
                                 byAccessor:^(NSURL *newURL) {
                                     data = [NSData dataWithContentsOfURL:newURL];
                                 }];
    return data;
}

- (void)addRecipesFromDocument:(PRPRecipesDocument *)newDoc {
    [self.recipes addObjectsFromArray:[newDoc recipes]];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:PRPRecipesDidChangeNotification
     object:self];
    [self updateChangeCount:UIDocumentChangeDone];
}

@end
