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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = _letra.letra;
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                             target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    ///////  Remover e fazer navigation na mao
    
    //Construir tela com objeto _letra
    /*
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Mostre uma palavra, uma figura e leia a palavra ao apertar um botao"
           forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
     */

}

-(void)next:(id)sender{
    
    LetrasViewController *viewController = [LetrasViewController sharedInstance];
    
    [self.navigationController pushViewController: [self novo]
                                          animated:YES];
}

-(instancetype) novo {
    LetraView *novo = [[LetraView alloc] initWithNibName:nil bundle:NULL];
    return novo;
}


@end






