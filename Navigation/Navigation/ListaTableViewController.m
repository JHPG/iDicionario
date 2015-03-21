//
//  ListaTableViewController.m
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/18/15.
//  Copyright (c) 2015 Jorge Henrique. All rights reserved.
//

#import "ListaTableViewController.h"

@interface ListaTableViewController ()

@end

@implementation ListaTableViewController
//@synthesize labelPalavra;


LetraView *letraView;

- (void)viewDidLoad {
    [super viewDidLoad];
    letraView = [LetraView sharedInstance];
//    UINib *nib = [UINib nibWithNibName:@"ListaTableViewCell bundle:@"ssfdsf"
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return letraView.letras.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CelulaPalavra"];
    
    //  LabelPalavra
//    UILabel *labelPalavra = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 100, 20)];
//    [labelPalavra setFont:[UIFont fontWithName: @"Trebuchet MS" size: 16.0f]];
//    [labelPalavra setText: [[letraView.letras objectAtIndex:indexPath.row] palavra]];
//    [cell addSubview:labelPalavra];
    
    [cell.textLabel setText: [[letraView.letras objectAtIndex:indexPath.row] letra]];
    [cell.detailTextLabel setText: [[letraView.letras objectAtIndex:indexPath.row] palavra]];
    [cell.imageView setImage: [[letraView.letras objectAtIndex:indexPath.row] imagem]];
    
    [cell autoresizesSubviews];

    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //passar parametros para o metodo [novo: obj]
    LetraView *lv = [LetraView sharedInstance];
    
    //Recebe parametros e cria view personalizada
    LetraView *novo = [[LetraView alloc] initWithNibName:nil bundle:NULL];
    
    Letra *letra = [lv.letras objectAtIndex: indexPath.row];
    [novo setLetra:letra];
    
    [self.navigationController pushViewController: novo animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
