//
//  UADetailViewController.m
//  Filmoteca
//
//  Created by José López Ruiz on 04/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import "UADetailViewController.h"
#import "UAPortadaViewController.h"
#include <CoreGraphics/CoreGraphics.h>

@interface UADetailViewController ()
- (void)configureView;
@end

@implementation UADetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(UAPelicula*)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        //[self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        //self.titulo.text = @"titulo";
        self.titulo.text = self.detailItem.titulo;
        self.director.text = self.detailItem.director;
        [self.edad setSelectedSegmentIndex:self.detailItem.edad];
        [self.valoracion setValue:self.detailItem.puntuacion];
        self.valornumerico.text = [NSString stringWithFormat:@"%.01f",self.detailItem.puntuacion];
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tituloexit:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)directorexit:(id)sender {
    [sender resignFirstResponder];

}

- (IBAction)guardar:(id)sender {
    [self.detailItem setDirector:self.director.text];
    [self.detailItem setTitulo:self.titulo.text];
    [self.detailItem setEdad:self.edad.selectedSegmentIndex];
    [self.detailItem setPuntuacion:self.valoracion.value];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString* identificador = [segue identifier];
    if ([identificador isEqualToString:@"showCartel"]) {
        [[segue destinationViewController] setDetailItem:self.detailItem];
    }
}


- (IBAction)mostrarcartel:(id)sender {
    /*UAPortadaViewController* vistaPortada = [[UAPortadaViewController alloc] init];
    CGFloat x = 0.0;
    CGFloat y = 0.0;
    vistaPortada.view.frame = CGRectMake(x, y, vistaPortada.view.frame.size.width, vistaPortada.view.frame.size.height);
    //[vistaPortada.view addSubview:vistaPortada.titulo];
    [self.view addSubview:vistaPortada.view];*/
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UAPortadaViewController *portadacontroller =(UAPortadaViewController*) [story instantiateViewControllerWithIdentifier:@"portadacontroller"];
    //[portadacontroller setTitle:@"Portada"];
    //[portadacontroller setPelicula:self.detailItem];
    //portadacontroller.titulo.text = @"Un titulo";
    //[self.view addSubview:portadacontroller.view];
    //[self addChildViewController:portadacontroller];*/
    [self presentViewController:portadacontroller animated:YES completion:nil];
}
@end
