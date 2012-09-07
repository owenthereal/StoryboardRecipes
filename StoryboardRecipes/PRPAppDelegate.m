//
//  PRPAppDelegate.m
//  StoryboardRecipes
//
//  Created by Owen on 2012-09-06.
//  Copyright (c) 2012 Owen. All rights reserved.
//

#import "PRPAppDelegate.h"
#import "PRPRecipesListViewController.h"
#import "PRPRecipesDocument.h"

@interface PRPAppDelegate()

@property (strong, nonatomic) PRPRecipesDocument *document;

@end

@implementation PRPAppDelegate

@synthesize window;
@synthesize document;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    PRPRecipesListViewController *controller = (PRPRecipesListViewController *)navigationController.topViewController;
    NSURL *docDir = [[[NSFileManager defaultManager]
                      URLsForDirectory:NSDocumentDirectory
                      inDomains:NSUserDomainMask] lastObject];
    NSURL *docURL = [docDir URLByAppendingPathComponent:@"Recipes.recipes"];
    PRPRecipesDocument *doc = [[PRPRecipesDocument alloc] initWithFileURL:docURL];  
    controller.dataSource = doc;
    [doc openWithCompletionHandler:^(BOOL success) {
        if(success) {
            [controller.tableView reloadData];
        } else {
            NSLog(@"Failed to open document");
        }
        
    }];
    self.document = doc;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    PRPRecipesDocument *newDoc = [[PRPRecipesDocument alloc] initWithFileURL:url];
    [newDoc openWithCompletionHandler:^(BOOL success) {
        if(success) {
            [self.document addRecipesFromDocument:newDoc];
        } else {
            NSLog(@"Failed to open new document - %@", url);
        } }];
    return YES;
}

@end
