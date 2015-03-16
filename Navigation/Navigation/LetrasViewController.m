//
//  LetrasViewController.m
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetrasViewController.h"
#import "LetraBViewController.h"
#import "LetraView.h"

@interface LetrasViewController ()

@end

@implementation LetrasViewController

//+ (instancetype)sharedInstance {
//    
//    static dispatch_once_t onceToken = 0;
//    __strong static LetrasViewController *instance = nil;
//    dispatch_once(&onceToken,^{
//        
//        instance = [[self alloc] init];
//        
//    });
//    return instance;
//}


-(void) viewDidLoad {
    [super viewDidLoad];
    
    _letras = [[NSMutableArray alloc] init];
    
    Letra *letraA = [[Letra alloc] init];
    [letraA setLetra:@"A"];
    
    //Preencher vetor de palavras
    [_letras addObject:letraA];
    
    //Inicializa view com o objeto atual
    LetraView *view = [[LetraView alloc] initWithLetra: [_letras objectAtIndex:0]];
    [self showViewController:view sender:nil];
}

@end
