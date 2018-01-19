//
//  CoreDataManager.m
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 17.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "JSONFilmModel.h"

@implementation CoreDataManager

+ (instancetype)sharedInstance
{
    static CoreDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataManager alloc] init];
        
    });
    return sharedInstance;
}

- (void) saveContextWithTitle:(JSONFilmModel*)filmForSave {
    
    NSManagedObjectContext *managedContext = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"FSHistoryManagedModel" inManagedObjectContext:managedContext];
    
    NSManagedObject* film = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:managedContext];
    
    [film setValue:filmForSave.filmTitle forKey:@"title"];
    [film setValue:filmForSave.filmYear forKey:@"year"];
    [film setValue:filmForSave.filmPoster forKey:@"posterUrl"];
    [film setValue:filmForSave.filmType forKey:@"type"];
    [film setValue:filmForSave.filmID forKey:@"filmId"]; 
    
    NSError *error = nil;
    if ([managedContext save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

- (void) loadContext {
    NSManagedObjectContext *managedContext = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"FSHistoryManagedModel"];
    
    if (fetchRequest != nil) {
        self.films = [[managedContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    }
}

-(BOOL) checkIsExist: (NSString*) title {
    NSManagedObjectContext *managedContext = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"FSHistoryManagedModel"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"title = %@", title]];
    [request setFetchLimit:1];
    NSUInteger count = [managedContext countForFetchRequest:request error:nil];
    if (count == NSNotFound) {
        // some error occurred
    }
    else {
        if (count == 0) {
            return YES;
        }
    }
    return NO;
}

@end
