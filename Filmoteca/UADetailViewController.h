//
//  UADetailViewController.h
//  Filmoteca
//
//  Created by José López Ruiz on 04/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAPelicula.h"

@interface UADetailViewController : UIViewController

@property (strong, nonatomic) UAPelicula* detailItem;
@property (weak, nonatomic) IBOutlet UITextField *titulo;
@property (weak, nonatomic) IBOutlet UITextField *director;
@property (weak, nonatomic) IBOutlet UISegmentedControl *edad;
@property (weak, nonatomic) IBOutlet UISlider *valoracion;
- (IBAction)tituloexit:(id)sender;
- (IBAction)directorexit:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *valornumerico;
- (IBAction)guardar:(id)sender;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
- (IBAction)mostrarcartel:(id)sender;
@end
