//
//  CoreDataManager.h
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 17.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "JSONFilmModel.h"

@interface CoreDataManager : NSObject

- (void) loadContext;
-(BOOL) checkIsExist: (NSString*) title;
+ (instancetype)sharedInstance;

- (void) saveContextWithTitle:(JSONFilmModel*)filmForSave;

@property (nonatomic,strong) NSMutableArray* films;

@end
