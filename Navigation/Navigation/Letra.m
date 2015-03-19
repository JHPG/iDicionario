//
//  Letra.m
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/16/15.
//  Copyright (c) 2015 Jorge Henrique. All rights reserved.
//

#import "Letra.h"

@implementation Letra


-(instancetype)initWithPalavra:(NSString*)palavra andImagem:(UIImage*)imagem {
    self = [super init];
    
    if(self){
        _letra = [palavra substringToIndex:1];
        _imagem = imagem;
        _palavra = palavra;
        //Som
    }
    return self;
}


@end
