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
    
    [_letras addObject: [[Letra alloc] initWithLetra:@"A" andImagem:nil andPalavra:@"Abelha"]];
    [_letras addObject: [[Letra alloc] initWithLetra:@"B" andImagem:nil andPalavra:@"Bala"]];
    [_letras addObject: [[Letra alloc] initWithLetra:@"C" andImagem:nil andPalavra:@"Cachorro"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"D" andImagem:nil andPalavra:@"Dado"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"E" andImagem:nil andPalavra:@"Elefante"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"F" andImagem:nil andPalavra:@"Foca"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"G" andImagem:nil andPalavra:@"Gelo"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"H" andImagem:nil andPalavra:@"Helicóptero"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"I" andImagem:nil andPalavra:@"Ilha"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"J" andImagem:nil andPalavra:@"Jabuti"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"L" andImagem:nil andPalavra:@"Lhama"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"M" andImagem:nil andPalavra:@"Macaco"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"N" andImagem:nil andPalavra:@"Navio"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"O" andImagem:nil andPalavra:@"Olho"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"P" andImagem:nil andPalavra:@"Pato"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"Q" andImagem:nil andPalavra:@"Queijo"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"R" andImagem:nil andPalavra:@"Rato"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"S" andImagem:nil andPalavra:@"Sapo"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"T" andImagem:nil andPalavra:@"Tatu"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"U" andImagem:nil andPalavra:@"Unicórnio"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"V" andImagem:nil andPalavra:@"Vaca"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"X" andImagem:nil andPalavra:@"Xampu"]];
//    [_letras addObject: [[Letra alloc] initWithLetra:@"Z" andImagem:nil andPalavra:@"Zoo"]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // NavBar
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                             target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    // Label
    UILabel *labelPalavra = [[UILabel alloc]
                       initWithFrame:CGRectMake(60, 200, 500, 100)];
    [labelPalavra setFont:[UIFont fontWithName: @"Trebuchet MS" size: 26.0f]];
    [self.view addSubview:labelPalavra];
    
    // Button
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"palavra, figura e botao falante" forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    [self.view addSubview:botao];
    
    ///////  Remover e fazer navigation na mao
    
    //Construir tela aqui  // Fazer td aqui
    self.title = _letra.letra;
    labelPalavra.text = _letra.palavra;
    
    
    /////////////////

}

-(void)viewWillUnload:(BOOL)animated{
    LetraView *lv = [LetraView sharedInstance];
    lv.index--;
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






