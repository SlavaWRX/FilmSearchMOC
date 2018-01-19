//
//  FSSearchViewController.m
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 11.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

#import "FSSearchViewController.h"
#import "RequestManager.h"
#import "JSONFilmModel.h"
#import "RouteProperties.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "CoreDataManager.h"


@interface FSSearchViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *films;


@end

@implementation FSSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.films = [[NSMutableArray alloc] init];
    [self.indicator setHidesWhenStopped:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



#pragma mark - Actions

- (IBAction)searchButtonDidPressed:(id)sender {
    [self.indicator setHidden:NO];
    [self.indicator startAnimating];
    [RequestManager.sharedInstance getFilmDescriptionByName:_searchTextField.text completion:^(NSMutableArray *filmList) {
        self.films = filmList;
        [self.tableView reloadData];
        [self.indicator stopAnimating];
    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.films.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    JSONFilmModel* film = [self.films objectAtIndex:indexPath.row];
    cell.textLabel.text = film.filmTitle;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RouteProperties.sharedInstance.filmForDescription = [self.films objectAtIndex:indexPath.row];
    [CoreDataManager.sharedInstance saveContextWithTitle:[self.films objectAtIndex:indexPath.row]];
    [self performSegueWithIdentifier:@"goDescription" sender:self];
}

@end
