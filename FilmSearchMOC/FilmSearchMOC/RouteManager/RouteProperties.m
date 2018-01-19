//
//  RouteProperties.m
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 17.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import "RouteProperties.h"

@implementation RouteProperties

+ (instancetype)sharedInstance
{
    static RouteProperties *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RouteProperties alloc] init];
        
    });
    return sharedInstance;
}

@end
