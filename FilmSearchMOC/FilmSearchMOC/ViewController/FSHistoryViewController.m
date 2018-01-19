//
//  FSHistoryViewController.m
//  FilmSearchMOC
//
//  Created by Viacheslav Goroshniuk on 18.01.2018.
//  Copyright © 2018 Viacheslav Goroshniuk. All rights reserved.
//

@import CoreData;
#import "FSHistoryViewController.h"
#import "FSFilmDetailViewController.h"
#import "CoreDataManager.h"
#import "RouteProperties.h"

@interface FSHistoryViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FSHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setData {
    [CoreDataManager.sharedInstance loadContext];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [[CoreDataManager.sharedInstance.films objectAtIndex:indexPath.row] valueForKey:@"title"];
    cell.textLabel.text = [[CoreDataManager.sharedInstance.films objectAtIndex:indexPath.row] valueForKey:@"title"];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return CoreDataManager.sharedInstance.films.count;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JSONFilmModel* film = [[JSONFilmModel alloc] init];
    
    film.filmTitle = [[CoreDataManager.sharedInstance.films objectAtIndex:indexPath.row] valueForKey:@"title"];
    
    film.filmType = [[CoreDataManager.sharedInstance.films objectAtIndex:indexPath.row] valueForKey:@"type"];
    film.filmID = [[CoreDataManager.sharedInstance.films objectAtIndex:indexPath.row] valueForKey:@"filmId"];
    film.filmYear = [[CoreDataManager.sharedInstance.films objectAtIndex:indexPath.row] valueForKey:@"year"];
    film.filmPoster = [[CoreDataManager.sharedInstance.films objectAtIndex:indexPath.row] valueForKey:@"posterUrl"];
    
    RouteProperties.sharedInstance.filmForDescription = film;
    [self performSegueWithIdentifier:@"goHistoryDescription" sender:self];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setData];
    CoreDataManager.sharedInstance.films = [[[CoreDataManager.sharedInstance.films reverseObjectEnumerator] allObjects] mutableCopy];
    [self.tableView reloadData];
}

@end
