//
//  Second.m
//  JSONParser
//
//  Created by Mubashir Meddekar on 15/10/2014.
//  Copyright (c) 2014 Mubashir Meddekar. All rights reserved.
//

#import "Second.h"

@interface Second ()
{
    NSArray *JsonArray;
    NSDictionary *JsonDict;
}
@end

@implementation Second

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSString * Requrl = @"http://api.kivaws.org/v1/loans/search.json?status=fundraising";
    
    NSURL * url = [NSURL URLWithString:Requrl];
    
    NSMutableURLRequest * UrlReq = [NSMutableURLRequest requestWithURL:url];
    
    __block NSError * error;
    
    [NSURLConnection sendAsynchronousRequest:UrlReq queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [[NSOperationQueue mainQueue]addOperationWithBlock:^
         {
             
             JsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
             
             JsonArray = JsonDict[@"loans"];
             
             NSLog(@"The value of array '%@'",JsonArray);
             
         }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)callParser
{
    

}

@end
