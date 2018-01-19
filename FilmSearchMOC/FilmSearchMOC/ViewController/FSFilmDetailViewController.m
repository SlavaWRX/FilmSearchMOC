//
//  FSFilmDetailViewController.m
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 11.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import "FSFilmDetailViewController.h"
#import "JSONFilmModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RouteProperties.h"

@interface FSFilmDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *filmPosterImage;
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmTypeLabel;

@end

@implementation FSFilmDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpData];
    
}

-(void) setUpData {
    
    self.filmTitleLabel.text = RouteProperties.sharedInstance.filmForDescription.filmTitle;
    self.filmYearLabel.text = RouteProperties.sharedInstance.filmForDescription.filmYear;
    self.filmTypeLabel.text = RouteProperties.sharedInstance.filmForDescription.filmType;
    [self.filmPosterImage sd_setImageWithURL:[NSURL URLWithString:RouteProperties.sharedInstance.filmForDescription.filmPoster]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
