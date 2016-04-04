//
//  UADetailViewController.h
//  Filmoteca
//
//  Created by José López Ruiz on 04/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UADetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
