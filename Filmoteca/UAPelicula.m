//
//  UAPelicula.m
//  Filmoteca
//
//  Created by José López Ruiz on 06/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import "UAPelicula.h"

@implementation UAPelicula
@synthesize titulo = _titulo;
@synthesize director = _director;
@synthesize edad = _edad;
@synthesize puntuacion = _puntuacion;
@synthesize estreno = _estreno;
//@synthesize listaActores;

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.director forKey:@"director"];
    [encoder encodeObject:self.titulo forKey:@"titulo"];
    [encoder encodeInteger:_edad forKey:@"edad"];
    [encoder encodeFloat:_puntuacion forKey:@"puntuacion"];
    [encoder encodeObject:_estreno forKey:@"estreno"];
    [encoder encodeObject:_listaActores forKey:@"listaActores"];
    NSData *image = UIImageJPEGRepresentation(self.portada, 1.0);
    [encoder encodeObject:image forKey:@"portada"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    self = [super init];
    _titulo = [decoder decodeObjectForKey:@"titulo"];
    _director = [decoder decodeObjectForKey:@"director"];
    _edad = [decoder decodeIntForKey:@"edad"];
    _puntuacion = [decoder decodeFloatForKey:@"puntuacion"];
    _estreno = [decoder decodeObjectForKey:@"estreno"];
    _listaActores = [decoder decodeObjectForKey:@"listaActores"];
    NSData *image = [decoder decodeObjectForKey:@"portada"];
    _portada = [UIImage imageWithData:image];
    return self;
}

+ (id)nueva{
    return [[UAPelicula alloc]init];
}

+ (id) nuevaWithTitulo:(NSString*) titulo{
    return [[UAPelicula alloc]initWithTitulo:titulo];
}

+ (id) nuevaWithTitulo:(NSString*) titulo
                   director:(NSString*) director
                       edad: (UAEdad) vedad
                 puntuacion: (float) vpuntuacion
               estreno:(NSDate*) estreno
               actores:(NSArray*)actores
               portada:(UIImage*)portada{
    return [[UAPelicula alloc] initWithTitulo:titulo director:director edad:vedad puntuacion:vpuntuacion
            estreno:estreno actores:actores portada:portada];
}

- (id) init{
    return [self initWithTitulo: @"Sin titulo"];
}

- (id) initWithTitulo:(NSString*) titulo{
    return [self initWithTitulo: titulo
                       director: @"Sin director"
                           edad: TP
                     puntuacion: 0.0
            estreno:[NSDate date]
                         actores:nil
                         portada:nil];
}

- (id) initWithTitulo:(NSString*) titulo
             director:(NSString*) director
                 edad: (UAEdad) vedad
           puntuacion: (float) vpuntuacion
              estreno: (NSDate*) estreno
              actores: (NSArray*) actores
            portada:(UIImage *)portada
{
    self = [super init];
    if(self != nil){
        /*_titulo = titulo;
        _director = director;
        _edad = vedad;
        _puntuacion = vpuntuacion;
        _estreno = estreno;*/
        [self setTitulo:titulo];
        [self setDirector:director];
        [self setEdad:vedad];
        [self setPuntuacion:vpuntuacion];
        [self setEstreno:estreno];
        [self setListaActores:actores];
        [self setPortada:portada];
    }
    return self;
}


- (NSString*) description{
    /*NSCalendar *calendario = [NSCalendar currentCalendar];
    NSDateComponents *componentes = [calendario
                                     components:(NSDayCalendarUnit | NSMonthCalendarUnit |
                                                 NSYearCalendarUnit)
                                     fromDate:_estreno];
    NSInteger anyo = [componentes year];*/
    //return [NSString stringWithFormat:@"%@ ( %ld, %@ )",self.titulo,(long)anyo,self.director];
    return [NSString stringWithFormat:@"%@ ",self.titulo];
}

- (void) antiguedad{
    NSCalendar *calendario = [NSCalendar currentCalendar];
    NSDateComponents *componentes = [calendario
                                     components:(NSDayCalendarUnit | NSMonthCalendarUnit |
                                                 NSYearCalendarUnit)
                                     fromDate:_estreno];
    NSInteger anyoestreno = [componentes year];
    NSDateComponents *componentesactual = [calendario
                                     components:(NSDayCalendarUnit | NSMonthCalendarUnit |
                                                 NSYearCalendarUnit)
                                     fromDate:[NSDate date]];
    NSInteger anyoactual = [componentesactual year];
    NSUInteger diferencia = anyoactual - anyoestreno;
    NSLog(@"La película tiene %lu años de antiguedad.",(unsigned long)diferencia);
}


@end
