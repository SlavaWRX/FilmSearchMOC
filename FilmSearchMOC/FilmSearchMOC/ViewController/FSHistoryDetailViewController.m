//
//  FSHistoryDetailViewController.m
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 19.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import "FSHistoryDetailViewController.h"
#import "JSONFilmModel.h"
#import "RouteProperties.h"
#import "CoreDataManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FSHistoryDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *filmPosterImage;
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmTypeLabel;

@end

@implementation FSHistoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setUpData {
    self.filmTitleLabel.text = RouteProperties.sharedInstance.filmForDescription.filmTitle;
    self.filmYearLabel.text = RouteProperties.sharedInstance.filmForDescription.filmYear;
    self.filmTypeLabel.text = RouteProperties.sharedInstance.filmForDescription.filmType;
    [self.filmPosterImage sd_setImageWithURL:[NSURL URLWithString:RouteProperties.sharedInstance.filmForDescription.filmPoster]];
    
    
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
