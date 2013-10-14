//
//  ViewController.m
//  crash1
//
//  Created by Jeremy Arimado on 14/10/13.
//  Copyright (c) 2013 Jeremy Arimado. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.MyQuotes = @[
                      
                      @"I love strings",
                      @"hey bro",
                      @"Dont cry over spilt milk",
                      @"Hey dude",
                      @"Sometihngs got a hold on my right now child",
                      @"The early bird",
                      @"As slow",
                      
                      ];
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes= [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)quoteButtonTapped:(id)sender {
    NSLog(@"Button Tapped :: %i", self.quoteOpt.selectedSegmentIndex);
    if (self.quoteOpt.selectedSegmentIndex == 2) {
        int array_tot = [self.myQuotes count];
        
        NSString *all_my_quotes = @" ";
        NSString *my_quote = Nil;
        
        for (int x=0; x < array_tot; x++) {
            my_quote = self.myQuotes[x];
            all_my_quotes = [NSString stringWithFormat:@"%@\n%@\n", all_my_quotes, my_quote];
        }
        self.quoteText.text = [NSString stringWithFormat:@"%@", all_my_quotes];
        
        /* int index = (arc4random() % array_tot);
        NSString *my_quote = self.myQuotes[index];
        self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote]; */
    } else {
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1) {
            selectedCategory = @"modern";
        }
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        int array_tot = [filteredArray count];
        if (array_tot > 0 ) {
            int index = (arc4random() % array_tot);
            NSString *quote = filteredArray[index][@"quote"];
            NSString *source = [[filteredArray objectAtIndex:index]valueForKey:@"source"];
            if (![source length] == 0) {
                quote = [NSString stringWithFormat:@"%@\n\n%@", quote, source];
                if([selectedCategory isEqualToString:@"classic"]) {
                    quote = [NSString stringWithFormat:@"From Classic Movie \n\n %@", quote];
                } else {
                    quote = [NSString stringWithFormat:@"From a Modern Movie\n\n %@", quote];
                }
                if ([source hasPrefix:@"Harry"]) {
                    quote = [NSString stringWithFormat:@"Harry Rocks!!\n\n%@", quote];
                }
                self.quoteText.text = quote;
                
            }
            self.quoteText.text = [NSString stringWithFormat:@"Movie Quote:\n \n%@", quote];
        } else {
            self.quoteText.text = [NSString stringWithFormat:@"No quotes to display."];
            
        }
        
        
        
        

    }
}

-(IBAction)movieQuoteButtonTapped:(id)sender {
    int array_tot = [self.movieQuotes count];
    int index = (arc4random() % array_tot);
    NSString *my_movieQuote = self.movieQuotes[index][@"quote"];
    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@", my_movieQuote];
}





@end




















