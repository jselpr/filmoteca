//
//  UAPortadaViewController.h
//  Filmoteca
//
//  Created by José López Ruiz on 21/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAPelicula.h"

@interface UAPortadaViewController : UIViewController{
    UAPelicula *pelicula;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
@property (weak, nonatomic) IBOutlet UIImageView *imageportada;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
- (void)setDetailItem:(UAPelicula*)newDetailItem;

@end
