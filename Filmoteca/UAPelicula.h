//
//  UAPelicula.h
//  Filmoteca
//
//  Created by José López Ruiz on 06/04/16.
//  Copyright (c) 2016 José López Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    TP,
    NR7,
    NR13,
    NR18
}UAEdad;

@interface UAPelicula : NSObject<NSCoding>{
    NSString *_titulo;
    NSString *_director;
    UAEdad _edad;
    float _puntuacion;
    NSDate *_estreno;
//    UIImage *portada;
}
@property (strong,nonatomic) NSString* titulo;
@property (strong,nonatomic) NSString* director;
@property (nonatomic) UAEdad edad;
@property (nonatomic) float puntuacion;
@property (strong,nonatomic) NSDate* estreno;
@property (strong,nonatomic) NSArray* listaActores;
@property (strong,nonatomic) UIImage *portada;

- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;
+ (id) nueva;
+ (id) nuevaWithTitulo:(NSString*) titulo;
+ (id) nuevaWithTitulo:(NSString*) titulo
        director:(NSString*) director
        edad: (UAEdad) vedad
        puntuacion: (float) vpuntuacion
               estreno: (NSDate*) estreno
               actores: (NSArray*) actores
               portada: (UIImage*) portada;
- (id) init;
- (id) initWithTitulo:(NSString*) titulo;
- (id) initWithTitulo:(NSString*) titulo
             director:(NSString*) director
                 edad: (UAEdad) vedad
           puntuacion: (float) vpuntuacion
              estreno: (NSDate*) estreno
              actores: (NSArray*) actores
              portada: (UIImage*) portada;

- (NSString*) description;
- (void) antiguedad;

@end
