//
//  ViewController2.m
//  SwiftDemo1
//
//  Created by AceWei on 16/4/28.
//  Copyright © 2016年 AceWei. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UITableViewDataSource, UITableViewDelegate>

@property IBOutlet UITableView *tableView;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
//    
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic2.zhimg.com/c6ee2216c5f0f62abd80c1a5c6c2e251.jpg"]];
//    cell.textLabel.text = @"见过最神奇的冠军：去年夏天赌他们赢，现在赚 5000 倍";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellID];
    }
    
    
    
    // Here we use the new provided sd_setImageWithURL: method to load the web image
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic2.zhimg.com/c6ee2216c5f0f62abd80c1a5c6c2e251.jpg"]
                      placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    
    cell.textLabel.text = @"My Text";
    
    return cell;
}


- (void)test
{
    NSLog(@"asdfsdF");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
