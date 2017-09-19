//
//  DetailsViewController.m
//  Obj-C-Assessment2
//
//  Created by CKH on 20/09/2017.
//  Copyright © 2017 CKH. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = self.displayProduct.name;
    self.nameTextField.text = self.displayProduct.name;
    self.dateTextField.text = self.displayProduct.date;
    self.imageView.image = self.displayProduct.image;

    self.nameTextField.enabled = NO;
    self.dateTextField.enabled = NO;
    self.nameTextField.hidden = YES;
}

#pragma mark - IBACtion
- (IBAction)wikiButtonTapped:(id)sender {
    //go to web view
}

- (IBAction)changeTitleButtonTapped:(id)sender {
    //change the title in 1st VC
    [self.delegate changeTitle:self.displayProduct.name];
}

#pragma mark - Edit action
- (IBAction)editButtonTapped:(id)sender {
    if(self.nameTextField.isEnabled){
        //hide name label
        self.nameTextField.hidden = YES;

        //save change
        [self saveChange];

        self.nameTextField.enabled = NO;
        self.dateTextField.enabled = NO;
        [self.editButton setTitle:@"Edit"];
    }
    else{
        //shoe name label
        self.nameTextField.hidden = NO;

        self.nameTextField.enabled = YES;
        self.dateTextField.enabled = YES;
        [self.editButton setTitle:@"Done"];
    }
}

- (void) saveChange{
    self.displayProduct.name = self.nameTextField.text;
    self.displayProduct.date = self.dateTextField.text;
    self.title = self.nameTextField.text;
}




@end
