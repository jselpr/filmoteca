//
//  UAPortadaViewController.m
//  Filmoteca
//
//  Created by José López Ruiz on 21/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import "UAPortadaViewController.h"
#import "UAPelicula.h"

@interface UAPortadaViewController ()

@end

@implementation UAPortadaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titulo.text = pelicula.titulo;
    self.imageportada.image = pelicula.portada;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setDetailItem:(UAPelicula*)newDetailItem
{
    if (pelicula != newDetailItem) {
        pelicula = newDetailItem;
        
        // Update the view.
        //[self configureView];
    }
}



- (IBAction)cerrar:(id)sender {
}
@end
