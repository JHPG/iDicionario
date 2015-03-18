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

@synthesize imageView, labelPalavra;

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
    
    //UIImage *s = [UIImage imageNamed:@"a"];
    //UIImage *s = [UIImage imageWithContentsOfFile:@"images/a.png"];
    
    [_letras addObject: [[Letra alloc] initWithLetra:@"A"
                                           andImagem:[UIImage imageNamed:@"a"] andPalavra:@"Abelha"]];
    [_letras addObject: [[Letra alloc] initWithLetra:@"B"
                                           andImagem:[UIImage imageNamed:@"b"] andPalavra:@"Bola"]];
    [_letras addObject: [[Letra alloc] initWithLetra:@"C"
                                           andImagem:[UIImage imageNamed:@"c"] andPalavra:@"Cachorro"]];
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
    
    LetraView *lv = [LetraView sharedInstance];
    _letra = [lv.letras objectAtIndex: lv.index];
    
    //Centro da view
    CGFloat centerView = self.view.center.x;
    
    //ToolBar
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [self.view addSubview:toolbar];
    #warning terminar toolbar
    
    // NavBar button
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                             target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    // LabelLetra
    UILabel *labelLetra = [[UILabel alloc]
                             initWithFrame: CGRectMake(centerView-10, 50, 500, 100)];
    [labelLetra setFont:[UIFont fontWithName: @"Trebuchet MS" size: 40.0f]];
    [self.view addSubview: labelLetra];
    
    // LabelPalavra
    labelPalavra = [[UILabel alloc]
                       initWithFrame: CGRectMake(centerView-120, 150, 500, 100)];
    [labelPalavra setFont:[UIFont fontWithName: @"Trebuchet MS" size: 32.0f]];
    [self.view addSubview:labelPalavra];
    
    //ImageView
    imageView = [[UIImageView alloc] initWithFrame: CGRectMake(self.view.frame.size.width, 0, 200, 180)];
    [self.view addSubview:imageView];
    
    
    // Button
    /* UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"palavra, figura e botao falante" forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    [self.view addSubview:botao];
    */
    
    ///////  Remover e fazer navigation na mao
    
    //Construir tela aqui  // Fazer td aqui
    self.title = _letra.letra;
    labelLetra.text = _letra.letra;
    labelPalavra.text = _letra.palavra;
    imageView.image = _letra.imagem;
    
    /////////////////
}

-(void)viewWillAppear:(BOOL)animated{
    
    //Centro da view
    CGFloat centerView = self.view.center.x;
    
    [self animateThis:imageView posicao: CGRectMake(centerView-100, 220, 200, 180)];
    
}

-(void)animateThis:(UIView*)el posicao:(CGRect)pos{
    [UIView animateWithDuration:1 delay:0.1 options: 0 //UIViewAnimationCurveEaseIn
                     animations:^{
                         el.frame = pos; //nova posição/tamanho
                         //imageView.frame = CGRectMake(centerView-100, 220, 200, 180)
                     }
                     completion:nil];
}

-(void)viewWillUnload:(BOOL)animated{
    LetraView *lv = [LetraView sharedInstance];
    lv.index--;
}

-(void)next:(id)sender {    //retorna o próximo
    
    //passar parametros para o metodo [novo: obj]
    LetraView *lv = [LetraView sharedInstance];
    
    if(lv.index+1 < lv.letras.count)
        lv.index++;
    else
        lv.index = 0;
    
    Letra *letra = [lv.letras objectAtIndex: lv.index];
    
    [self.navigationController pushViewController: [self novo:letra] animated:YES];
    
    //[[self.navigationController.viewControllers objectAtIndex: lv.index-1] popNavigationItemAnimated:NO];
    
}

-(void)previous:(id)sender {    //retorna o anterior //Não está sendo chamado ainda
    
    //passar parametros para o metodo [novo: obj]
    LetraView *lv = [LetraView sharedInstance];
    
    if(lv.index > 0)
        lv.index--;
    else
        lv.index = (int) lv.letras.count-1;

    Letra *letra = [lv.letras objectAtIndex: lv.index];
    
    [self.navigationController pushViewController: [self novo:letra] animated:YES];
    
}

-(instancetype)novo: (Letra*) obj { //Retorna view personalizada
    
    //Recebe parametros e cria view personalizada
    LetraView *novo = [[LetraView alloc] initWithNibName:nil bundle:NULL];
    [novo setLetra: obj];
    
    return novo;
}




@end






