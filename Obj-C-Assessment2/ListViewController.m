//
//  ViewController.m
//  Obj-C-Assessment2
//
//  Created by CKH on 20/09/2017.
//  Copyright © 2017 CKH. All rights reserved.
//

#import "ListViewController.h"
//Need to import the class (custome object, tableviewCell, nextVC, etc..) before using
#import "AppleProduct.h"
#import "DetailsViewController.h"
#import "ProdcutTableViewCell.h"

//Protocol Confirmation Goes Here , in the <Protocol>
//Delegate 1.
@interface ListViewController () <UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate>

//Declare all the property inside the `inteface`
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//Declaring property, type usually start with NS,having pointer
//For array need to know (is it mutable or not)
@property (strong, nonatomic) NSMutableArray<AppleProduct *> *products;

@end

@implementation ListViewController

//implementing all the function in `implementation`

- (void)viewDidLoad {
    [super viewDidLoad];
    //Access the property using dot notation
    //Always need to use `self` to refer property
    //Every line need to end with `;`
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    //String @"str"
    self.title = @"Apple Product";

    //Need to alloc init
    //Function call using `[]`
    self.products = [[NSMutableArray alloc] init];
//    self.products = [NSMutableArray new];

//    NSString *product1 = @"AppleX";
//
//    [self.products addObject:product1];
    [self populateAppleProduct];
    [self.tableView reloadData];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void) populateAppleProduct {
    AppleProduct *product1 = [[AppleProduct alloc]initWithName:@"Apple I" Date:@"1976 July 1" Url:@"https://en.wikipedia.org/wiki/Apple_I" Image:[UIImage imageNamed:@"Apple_I"]];

    AppleProduct *product2 = [[AppleProduct alloc]initWithName:@"iPad Pro (9.7\")" Date:@"2016 March 31" Url:@"https://en.wikipedia.org/wiki/IPad_Pro" Image:[UIImage imageNamed:@"IPad_Pro"]];

    AppleProduct *product3 = [[AppleProduct alloc]initWithName:@"iPhone SE" Date:@"2016 March 31" Url:@"https://en.wikipedia.org/wiki/IPhone_SE" Image:[UIImage imageNamed:@"IPhone_SE"]];

    AppleProduct *product4 = [[AppleProduct alloc]initWithName:@"MacBook (Early 2016)" Date:@"2016 April 19" Url:@"https://en.wikipedia.org/wiki/MacBook_(2015_version)" Image:[UIImage imageNamed:@"MacBook_with_Retina_Display"]];

    AppleProduct *product5 = [[AppleProduct alloc]initWithName:@"iPhone 7 Plus" Date:@"2016 September 16" Url:@"https://en.wikipedia.org/wiki/IPhone_7_Plus" Image:[UIImage imageNamed:@"IPhone_7_Plus_Jet_Black"]];

    AppleProduct *product6 = [[AppleProduct alloc]initWithName:@"Apple AirPods" Date:@"2016 October" Url:@"https://en.wikipedia.org/wiki/Apple_earbuds" Image:[UIImage imageNamed:@"AirPods"]];

    AppleProduct *product7 = [[AppleProduct alloc]initWithName:@"Apple" Date:@"Everyday" Url:@"https://en.wikipedia.org/wiki/apple" Image:[UIImage imageNamed:@"Apple"]];

    [self.products addObject:product1];
    [self.products addObject:product2];
    [self.products addObject:product3];
    [self.products addObject:product4];
    [self.products addObject:product5];
    [self.products addObject:product6];
    [self.products addObject:product7];

}

//function
//syntax
//No parameter
// - (ReturnType) FuncName { code }
//Wiht parameter
// - (ReturnType) FuncName: (DataType)paramName { code }
// - (ReturnType) FuncName: (DataType)paramName outerParamName: (DataType2)paramName2 { code }

#pragma mark - UITableView Datasource
//to get autocomplete for function, start with `-`
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //declare var
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"emptyCell"];
    AppleProduct *displayedProduct = self.products[indexPath.row];

    cell.textLabel.text = displayedProduct.name;
    cell.detailTextLabel.text = displayedProduct.date;
    cell.imageView.image = displayedProduct.image;
     */

    ProdcutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    AppleProduct *displayedProduct = self.products[indexPath.row];

    cell.name.text = displayedProduct.name;
    cell.date.text = displayedProduct.date;
    cell.image.image = displayedProduct.image;

    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DetailsViewController *targetVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];

    //pass data
    targetVC.displayProduct = self.products[indexPath.row];
    //Delegate 2.
    targetVC.delegate = self;
    //Bool in Obj-C is YES / NO
    [self.navigationController pushViewController:targetVC animated:YES];
}

//Delegate 3.
#pragma mark - Custome Delegate 
- (void)changeTitle:(NSString *)title {
    self.title = title;
}
@end
