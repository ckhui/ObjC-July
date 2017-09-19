//
//  AppleProduct.m
//  Obj-C-Assessment2
//
//  Created by CKH on 20/09/2017.
//  Copyright © 2017 CKH. All rights reserved.
//

#import "AppleProduct.h"

@implementation AppleProduct

//creat init func
- (instancetype)init
{
    self = [super init];
    if (self) {
        //can access property declare in `.h`
        self.name = @"name";
        self.date = @"date";
        self.url = @"url";
        self.image = [UIImage imageNamed:@"Unknown"];

    }
    return self;
}


- (instancetype)initWithName: (NSString *)name Date: (NSString *)date Url: (NSString *)url Image: (UIImage *)image {
    self = [super init];
    if (self) {
        self.name = name;
        self.date = date;
        self.url = url;
        self.image = image;
    }
    return self;
}

@end
