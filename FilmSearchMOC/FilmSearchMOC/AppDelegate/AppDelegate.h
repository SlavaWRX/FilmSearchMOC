//
//  AppDelegate.h
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 11.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

