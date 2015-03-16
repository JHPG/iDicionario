//
//  LetraView.m
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraView.h"
#import "LetrasViewController.h"

@interface LetraView ()
    
@end

@implementation LetraView

-(instancetype)initWithLetra: (Letra*) l{
    self = [super init];
    
    if(self){
        _letra = l;
    }
    return self;
}

+ (instancetype)sharedInstance {

    static dispatch_once_t onceToken = 0;
    __strong static LetraView *instance = nil;
    dispatch_once(&onceToken,^{

        instance = [[self alloc] init];
        [instance setIndex:0];
        instance.letras = [[NSMutableArray alloc] init];
        [instance prencherLetras];

    });
    return instance;
}

-(void) prencherLetras{
    
    Letra *letra = [[Letra alloc] init];
    [letra setLetra:@"A"];
    [_letras addObject: letra];
    
    Letra *letra1 = [[Letra alloc] init];
    [letra1 setLetra:@"B"];
    [_letras addObject: letra1];
    
    Letra *letra2 = [[Letra alloc] init];
    [letra2 setLetra:@"C"];
    [_letras addObject: letra2];
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = _letra.letra;
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                             target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    ///////  Remover e fazer navigation na mao
    
    //Construir tela com objeto _letra // Fazer td aqui
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"palavra, figura e botao falante"
           forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];

}

-(void)next:(id)sender {    //retorna o próximo
    
    //passar parametros para o metodo [novo: obj]
    LetraView *lv = [LetraView sharedInstance];
    
    if(lv.index < lv.letras.count){
        
        Letra *letra = [lv.letras objectAtIndex: lv.index];
        lv.index++;
        
        [self.navigationController pushViewController: [self novo:letra] animated:YES];
    }
}

-(void)previous:(id)sender {    //retorna o anterior
    
    //passar parametros para o metodo [novo: obj]
    LetraView *lv = [LetraView sharedInstance];
    
    if(lv.index > 0){
        
        lv.index--;
        Letra *letra = [lv.letras objectAtIndex: lv.index];
        
        [self.navigationController pushViewController: [self novo:letra] animated:YES];
    }
    
}

-(instancetype)novo: (Letra*) obj { //Retorna view personalizada
    
    //Recebe parametros e cria view personalizada
    LetraView *novo = [[LetraView alloc] initWithNibName:nil bundle:NULL];
    [novo setLetra: obj];
    
    return novo;
}


@end






