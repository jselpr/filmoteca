//
//  UAMasterViewController.h
//  Filmoteca
//
//  Created by José López Ruiz on 04/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAPelicula.h"
#import "UADetailViewController.h"

@interface UAMasterViewController : UITableViewController
- (NSString*) contenidoFichero1;
- (NSString*) contenidoFichero2;
- (NSString*) contenidoFichero3;
@property (strong,nonatomic) NSMutableArray *listaPeliculas;
@property (strong,nonatomic) UADetailViewController* detailViewController;
- (UAPelicula*) nuevapelicula: (NSInteger) numero;
- (void) initTemporizador;
- (void) listener;
- (void) tick;
- (BOOL) save;
- (UADetailViewController *) getDetailController;

//- (void) sincronizado;
@end
