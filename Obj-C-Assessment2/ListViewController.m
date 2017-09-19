//
//  ViewController.m
//  Obj-C-Assessment2
//
//  Created by CKH on 20/09/2017.
//  Copyright © 2017 CKH. All rights reserved.
//

#import "ListViewController.h"

//Protocol Confirmation Goes Here , in the <Protocol>
@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

//Declare all the property inside the `inteface`
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//Declaring property, type usually start with NS,having pointer
//For array need to know (is it mutable or not)
@property (strong, nonatomic) NSMutableArray<NSString *> *products;

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

    NSString *product1 = @"AppleX";

    [self.products addObject:product1];
    [self.tableView reloadData];

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"emptyCell"];

    NSString *displayedProduct = self.products[indexPath.row];

    cell.textLabel.text = displayedProduct;

    return cell;
}

@end
