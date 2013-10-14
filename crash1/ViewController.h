//
//  ViewController.h
//  crash1
//
//  Created by Jeremy Arimado on 14/10/13.
//  Copyright (c) 2013 Jeremy Arimado. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;
@property (nonatomic,strong) IBOutlet UITextView *quoteText;
@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;




- (IBAction)quoteButtonTapped:(id)sender;
- (IBAction)movieQuoteButtonTapped:(id)sender;
@end


