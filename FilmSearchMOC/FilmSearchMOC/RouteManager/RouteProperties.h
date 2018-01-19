//
//  RouteProperties.h
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 17.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONFilmModel.h"

@interface RouteProperties : NSObject
+(instancetype)sharedInstance;

@property (nonatomic, strong) JSONFilmModel* filmForDescription;
@end
