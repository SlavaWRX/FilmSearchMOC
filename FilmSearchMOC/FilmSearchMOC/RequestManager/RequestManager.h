//
//  RequestManager.h
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 16.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

+(instancetype)sharedInstance;

-(void) getFilmDescriptionByName:(NSString*) filmName completion: (void (^) (NSMutableArray* filmList))finishBlock;

@end
