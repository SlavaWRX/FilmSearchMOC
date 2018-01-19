//
//  RequestManager.m
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 16.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import "RequestManager.h"
#import <AFNetworking.h>
#import "JSONFilmModel.h"

@interface RequestManager ()

@property (nonatomic,strong) NSString* apiKey;

@end

@implementation RequestManager


+ (instancetype)sharedInstance
{
    static RequestManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RequestManager alloc] init];
        
    });
    return sharedInstance;
}

-(void)getFilmDescriptionByName:(NSString*) filmName completion: (void (^) (NSMutableArray* filmList))finishBlock {
    
    _apiKey =  [NSString stringWithFormat:@"http://www.omdbapi.com/?s=%@&apikey=5482c933", filmName];
    //@"http://www.omdbapi.com/?i=tt3896198&apikey=5482c933";
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager* manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL * url = [NSURL URLWithString:_apiKey];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        
        
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
        
        NSMutableArray* filmList = [[NSMutableArray alloc] init];
        
        NSArray *jsonArray = (NSArray *)responseObject;
        
        for (NSDictionary *film in [jsonArray valueForKey:@"Search"]) {
            JSONFilmModel *model = [[JSONFilmModel alloc] init];
            model.filmType = [film valueForKey:@"Type"];
            model.filmPoster = [film valueForKey:@"Poster"];
            model.filmTitle = [film valueForKey:@"Title"];
            model.filmYear = [film valueForKey:@"Year"];
            model.filmID = [film valueForKey:@"imbdID"];
            [filmList addObject:model];
        }
        finishBlock(filmList);
    }];
    [dataTask resume];
    
}
@end
