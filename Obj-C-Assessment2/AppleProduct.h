//
//  AppleProduct.h
//  Obj-C-Assessment2
//
//  Created by CKH on 20/09/2017.
//  Copyright © 2017 CKH. All rights reserved.
//

#import <Foundation/Foundation.h>
//Import to get UIkit
#import <UIKit/UIKit.h>

//Baseclass is NSObject
//For properties and function you want to make it accessable by other class, put in `.h`
@interface AppleProduct : NSObject

//Create Public Property
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage *image;

//Make Function Public
- (instancetype)initWithName: (NSString *)name Date: (NSString *)date Url: (NSString *)url Image: (UIImage *)image;

@end
