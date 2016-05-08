//
//  UAMasterViewController.m
//  Filmoteca
//
//  Created by José López Ruiz on 04/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import "UAMasterViewController.h"

#import "UADetailViewController.h"
#import "UAPelicula.h"
#import "UASwitch.h"

@interface UAMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation UAMasterViewController
@synthesize listaPeliculas;
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (UAPelicula*) nuevapelicula: (NSInteger) numero{
    if (numero == 0) {
        NSDateComponents *componentes = [[NSDateComponents alloc] init];
        [componentes setDay: 03];
        [componentes setMonth: 06];
        [componentes setYear: 1996];
        NSCalendar *calendario = [NSCalendar currentCalendar];
        NSDate *estreno = [calendario dateFromComponents:componentes];
        NSArray* actores = [NSArray arrayWithObjects:@"Pedro",@"Juna", nil];
        UAPelicula* pelicula = [UAPelicula nuevaWithTitulo:@"El Resplandor" director:@"Stanley Kubrick" edad:NR18 puntuacion:7.3 estreno: estreno actores: actores
                                portada:[UIImage imageNamed:@"resplandor-cumple.jpg"]];
                                return pelicula;
    }
    if (numero == 1) {
        NSDateComponents *componentes = [[NSDateComponents alloc] init];
        [componentes setDay: 20];
        [componentes setMonth: 06];
        [componentes setYear: 2006];
        NSCalendar *calendario = [NSCalendar currentCalendar];
        NSDate *estreno = [calendario dateFromComponents:componentes];
        NSArray* actores = [NSArray arrayWithObjects:@"Carlos",@"Maria", nil];
        UAPelicula* pelicula = [UAPelicula nuevaWithTitulo:@"Señales del Futuro" director:@"George Lucas" edad:NR13 puntuacion:6.3 estreno: estreno actores: actores
                                portada:[UIImage imageNamed:@"senales_del_futuro.jpg"]];
        return pelicula;
    }
    if (numero == 2) {
        NSDateComponents *componentes = [[NSDateComponents alloc] init];
        [componentes setDay: 15];
        [componentes setMonth: 10];
        [componentes setYear: 2010];
        NSCalendar *calendario = [NSCalendar currentCalendar];
        NSDate *estreno = [calendario dateFromComponents:componentes];
        NSArray* actores = [NSArray arrayWithObjects:@"Antonio",@"Jhon", nil];
        UAPelicula* pelicula = [UAPelicula nuevaWithTitulo:@"Lo que la verdad esconde" director:@"Alberto Sicilia" edad:NR7 puntuacion:5.1 estreno: estreno actores: actores
                                portada:[UIImage imageNamed:@"bigtmp_938.jpg"]];
        return pelicula;
    }
    return nil;
}

- (void) initTemporizador{
    
    [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(tick) userInfo:nil repeats:NO];
    NSLog(@"Creado el temporizador");
}

- (void) tick{
    NSLog(@"Dentro de tick");
    NSNotification* notificacion = [NSNotification notificationWithName:@"TemporizadorCompletado" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:notificacion];
}

- (void) listener{
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sincronizado) name:@"TemporizadorCompletado" object:nil];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"TemporizadorCompletado" object:nil queue:nil usingBlock: ^(NSNotification* notificacion){
        //UAPelicula* pelicula = [self nuevapelicula:2];
//        listaPeliculas = [listaPeliculas arrayByAddingObject:@"Que película"];
        [listaPeliculas addObject:[self nuevapelicula:2]];
        [self.tableView reloadData];
    }];

}

/*- (void) sincronizado{
    UAPelicula* pelicula = [self nuevapelicula:2];
    listaPeliculas = [listaPeliculas arrayByAddingObject:pelicula];
    [self.tableView reloadData];
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.title = @"Filmoteca";
    self.title = [self.title uppercaseStringWithLocale:nil];
    // Establecemos la fecha del estreno
    /*NSDateComponents *componentes = [[NSDateComponents alloc] init];
    [componentes setDay: 03];
    [componentes setMonth: 06];
    [componentes setYear: 1996];
    NSCalendar *calendario = [NSCalendar currentCalendar];
    NSDate *estreno = [calendario dateFromComponents:componentes];
    pelicula = [UAPelicula nuevaWithTitulo:@"El Resplandor" director:@"Stanley Kubrick" edad:NR18 puntuacion:7.3 estreno: estreno];*/
//    [self initTemporizador];
//    [self listener];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent: @"filmoteca"];

    listaPeliculas = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if (!listaPeliculas) {
        UAPelicula* pelicula1 = [self nuevapelicula:0];
        UAPelicula* pelicula2 = [self nuevapelicula:1];
        UAPelicula* pelicula3 = [self nuevapelicula:2];
        listaPeliculas = [NSMutableArray arrayWithObjects:pelicula1,pelicula2,pelicula3,nil];

    }
/*    UAPelicula* pelicula1 = [self nuevapelicula:0];
    UAPelicula* pelicula2 = [self nuevapelicula:1];
    listaPeliculas = [NSMutableArray arrayWithObjects:pelicula1,pelicula2, nil];*/
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)[listaPeliculas count];
    //return 5;
    //return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
    //NSString *etiqueta = @"Posicion ";
    cell.textLabel.font=[UIFont systemFontOfSize:14.0];
    NSInteger linea = indexPath.row;
    //NSString * strLinea = [@(linea) stringValue];
    //cell.textLabel.text = [etiqueta stringByAppendingString:strLinea];
    //if (linea == 0) {
        //UAPelicula* pelicula1 = [listaPeliculas objectAtIndex:linea];
    
    id item = [listaPeliculas objectAtIndex:linea];
    //cell.textLabel.text = pelicula1.description;
    if ([item respondsToSelector:@selector(titulo)]) {
        UASwitch *interruptor = [[UASwitch alloc] init];
        [interruptor setCelda:cell];
        cell.accessoryView = interruptor;
        [interruptor addTarget:self action:@selector(fireInterruptor:) forControlEvents:UIControlEventValueChanged];
        UAPelicula* pelicula1 = (UAPelicula*) item;
        cell.textLabel.text = pelicula1.description;
        cell.imageView.image = pelicula1.portada;
        [pelicula1 antiguedad];
    } else {
        NSString* texto = (NSString*) item;
        cell.textLabel.text = [texto description];
    }
    /*} else {
        cell.textLabel.text = @"";
    }
    if (linea == 1) {
        cell.textLabel.text = [self contenidoFichero1];
    }

    if (linea == 2) {
        cell.textLabel.text = [self contenidoFichero2];
    }

    if (linea == 3) {
        cell.textLabel.text = [self contenidoFichero3];
    }*/

    return cell;
}

- (IBAction)fireInterruptor:(id)sender{
    UASwitch *onoff = (UASwitch *) sender;
    if (onoff.on) {
        onoff.celda.textLabel.textColor = [UIColor redColor];
        onoff.celda.textLabel.backgroundColor = [UIColor grayColor];
    } else {
        onoff.celda.textLabel.textColor = [UIColor blackColor];
        onoff.celda.textLabel.backgroundColor = [UIColor whiteColor];
    }
}
- (NSString*) contenidoFichero1{
    NSError * error;
    NSString * lecturaFichero1 = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"texto1" ofType:@"txt"] encoding:NSUTF8StringEncoding error:&error];
    if (error == nil) {
        return lecturaFichero1;
    } else
    {
        return [error localizedFailureReason];
    }
}

- (NSString*) contenidoFichero2{
    NSError * error;
    NSString * lecturaFichero2 = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"texto2" ofType:@"txt"] encoding:NSUTF8StringEncoding error:&error];
    if (error == nil) {
        return lecturaFichero2;
    } else
    {
        return [error localizedFailureReason];
    }
}

- (NSString*) contenidoFichero3{
    NSError * error;
    NSString * lecturaFichero2 = [[NSString alloc] initWithContentsOfFile:@"/texto2.txt" encoding:NSUTF8StringEncoding error:&error];
    if (error == nil) {
        return lecturaFichero2;
    } else
    {
        NSInteger strError = error.code;
        NSLog(@"Se ha producido un error %ld",(long)strError);
        return @"";
    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (UADetailViewController*) getDetailController{
    id identificador = self.parentViewController;
    return identificador;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*NSInteger linea = indexPath.row;
    id item = [listaPeliculas objectAtIndex:linea];
    UAPelicula* pelicula;
    if ([item respondsToSelector:@selector(titulo)]) {
        pelicula = (UAPelicula*) item;
    }
    if (!self.detailViewController) {
        self.detailViewController = [[UADetailViewController alloc] initWithNibName:@"detailFilm" bundle:nil];
    }
    
    UIViewController *masterVC = [self.splitViewController.viewControllers firstObject];
    UIViewController *detailVC;
    //if (self.splitViewController.viewControllers.count > 1) {
        detailVC = self.splitViewController.viewControllers[1];
    //}
    self.detailViewController = (UADetailViewController*) detailVC;*/
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger linea = indexPath.row;
        id item = [listaPeliculas objectAtIndex:linea];
        UAPelicula* pelicula;
        if ([item respondsToSelector:@selector(titulo)]) {
            pelicula = (UAPelicula*) item;
        }

//        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:pelicula];
    }
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (BOOL) save{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent: @"filmoteca"];

    return [NSKeyedArchiver archiveRootObject:listaPeliculas toFile:filePath];
}

@end
