//
//  LetraView.m
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/16/15.
//  Copyright (c) 2015 Jorge Henrique. All rights reserved.
//

#import "LetraView.h"
#import "ListaTableViewController.h"

@interface LetraView ()
    
@end

@implementation LetraView

@synthesize imageView, labelPalavra;
//Centro da view
CGFloat centerView;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    LetraView *lv = [LetraView sharedInstance];
    _letra = [lv.letras objectAtIndex: lv.index];
    
    //Centro da view
    centerView = self.view.center.x;

    
    //ToolBar
    CGFloat posicaoY = self.view.bounds.size.height-92;
    CGFloat width = self.view.bounds.size.width;
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, posicaoY, width, 44)];
    UIBarButtonItem *editarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                                     UIBarButtonSystemItemEdit target:self action:@selector(editar:)];
    [toolbar setItems: @[editarButton]]; //Add na toolbar
    [self.view addSubview: toolbar];
    
    // NavBar button
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                          target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    // LabelLetra
    UILabel *labelLetra = [[UILabel alloc] initWithFrame: CGRectMake(centerView-10, 50, 500, 100)];
    [labelLetra setFont:[UIFont fontWithName: @"Trebuchet MS" size: 40.0f]];
    [self.view addSubview: labelLetra];
    
    // LabelPalavra
    labelPalavra = [[UILabel alloc] initWithFrame: CGRectMake(centerView-120, 130, 500, 100)];
    [labelPalavra setFont:[UIFont fontWithName: @"Trebuchet MS" size: 32.0f]];
    [self.view addSubview:labelPalavra];
    
    //ImageView
    imageView = [[UIImageView alloc] initWithFrame: CGRectMake(self.view.frame.size.width, 0, 200, 180)];
#warning Trocar tamanho da imagem aqui também
    [imageView setUserInteractionEnabled:YES];
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
    self.navigationController.title = @"Navegar";
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    if (touch.view == imageView){
        CGPoint location = [touch locationInView:self.view];
        //Verificar se o touch está em cima da imagem antes
        [imageView setCenter:location]; //Movimenta pela tela
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGFloat width = imageView.bounds.size.width;
    CGFloat height = imageView.bounds.size.height;
    //[self animateThis1:imageView posicao:CGRectMake(centerView-100, 220, width+100, height+100) duration:0.2];
    
    CGPoint center = imageView.center;
    UITouch *touch = [touches anyObject];
    if (touch.view == imageView){
        [UIView animateWithDuration:0.3 delay:0 options: 0 //UIViewAnimationCurveEaseIn
                     animations:^{
                         imageView.frame = CGRectMake(centerView-100, 220, width+100, height+100);
                         [imageView setCenter:center];
                     }
                     completion:nil];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if (touch.view == imageView){
        CGFloat width = imageView.bounds.size.width;
        CGFloat height = imageView.bounds.size.height;
        [self animateThis1:imageView posicao:CGRectMake(centerView-100, 220, width-100, height-100) duration:0.2];
    }
}

-(void) prencherLetras{
    
    //UIImage *s = [UIImage imageNamed:@"a"];
    //UIImage *s = [UIImage imageWithContentsOfFile:@"images/a.png"]; //n funciona
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Abelha" andImagem:[UIImage imageNamed:@"a"]]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Bola" andImagem:[UIImage imageNamed:@"b"]]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Cachorro" andImagem:[UIImage imageNamed:@"c"]]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Dado" andImagem:[UIImage imageNamed:@"d"]]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Elefante" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Foca" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Gelo" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Helicóptero" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Ilha" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Jabuti" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Lhama" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Macaco" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Navio" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Olho" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Pato" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Queijo" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Rato" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Sapo" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Tatu" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Unicórnio" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Vaca" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Xampu" andImagem:nil]];
    [_letras addObject: [[Letra alloc] initWithPalavra:@"Zoo" andImagem:nil]];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self animateThis1:imageView posicao:CGRectMake(centerView-100, 220, 200, 180) duration:0.8];
}

-(void)viewWillUnload:(BOOL)animated{
    LetraView *lv = [LetraView sharedInstance];
    lv.index--;
}

-(void)viewDidDisappear:(BOOL)animated{
    imageView.frame = CGRectMake(self.view.frame.size.width, 0, 200, 180);  //Zera a posicao da imagem antes de voltar
}

-(void)animateThis1:(UIView*)el posicao:(CGRect)pos duration:(float)duration{
    CGPoint center = el.center;
    
    [UIView animateWithDuration:duration delay:0.1 options: 0 //UIViewAnimationCurveEaseIn
                     animations:^{
                         el.frame = pos; //nova posição/tamanho
//                         imageView.frame = CGRectMake(centerView-100, 220, 200, 180)
//                         CGFloat x = el.
//                         CGPoint center = [CGPointMake(x, y)]
                     }
                     completion:nil];
}

-(void)next:(id)sender {    //retorna o próximo
    
    //passar parametros para o metodo [novo: obj]
    LetraView *lv = [LetraView sharedInstance];
    
    Letra *letra = [lv.letras objectAtIndex: lv.index];
    
    [self.navigationController pushViewController: [self novo:letra] animated:YES];
    
    //[[self.navigationController.viewControllers objectAtIndex: lv.index-1] popNavigationItemAnimated:NO];
    
}

-(void)previous:(id)sender {    //retorna o anterior # Não está sendo chamado ainda
    
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

-(void) editar: (id)sender{
    
    NSLog(@"Edit");
    
}


@end






