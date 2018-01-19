//
//  JSONFilmModel.h
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 17.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONFilmModel : NSObject
@property (strong, nonatomic) NSString *filmTitle;
@property (strong, nonatomic) NSString *filmType;
@property (strong, nonatomic) NSString *filmYear;
@property (strong, nonatomic) NSString *filmID;
@property (strong, nonatomic) NSString *filmPoster;
@end
