//
//  DetailsViewController.h
//  Obj-C-Assessment2
//
//  Created by CKH on 20/09/2017.
//  Copyright © 2017 CKH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppleProduct.h"

//Custome Delegate
//1. Protocol
@protocol DetailViewControllerDelegate <NSObject>
- (void) changeTitle:(NSString *) title;
@end

@interface DetailsViewController : UIViewController
//public var
@property (strong, nonatomic) AppleProduct *displayProduct;
//2. Delegate var (weak)
@property (weak, nonatomic) id<DetailViewControllerDelegate> delegate;

@end
