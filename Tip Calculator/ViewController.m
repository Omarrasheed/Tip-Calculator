//
//  ViewController.m
//  Tip Calculator
//
//  Created by Omar Rasheed on 6/26/18.
//  Copyright © 2018 Omar Rasheed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UITextField *billField;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@property (weak, nonatomic) IBOutlet UISlider *tipSlider;

@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tipSlider.value = 0.1;
    NSLog(@"%@", self.billField.text);
    NSLog(@"%f", [[self.billField.text substringFromIndex:1] doubleValue]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    NSLog(@"%f", self.tipSlider.value);
    if ([[self.billField.text substringToIndex:1]  isEqual: @"$"]) {
        float bill = [[self.billField.text substringFromIndex:1] doubleValue];
        
        float tipPercentage = self.tipSlider.value;
        float tip = bill*tipPercentage;
        float total = bill + tip;
        
        self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
        self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
        self.percentageLabel.text = [NSString stringWithFormat:@"%.1f%s", self.tipSlider.value*100, "%"];
    } else {
        float bill = [self.billField.text doubleValue];
        
        float tipPercentage = self.tipSlider.value;
        float tip = bill*tipPercentage;
        float total = bill + tip;
        
        self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
        self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
        self.percentageLabel.text = [NSString stringWithFormat:@"%.1f%s", self.tipSlider.value*100, "%"];
    }
    
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.7 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newframe = self.billField.frame;
    newframe.origin.y -= 30;
    
    self.billField.text = [NSString stringWithFormat: @"$%.2f", [self.billField.text doubleValue]];
    
    [UIView animateWithDuration:0.7 animations:^{
        self.billField.frame = newframe;
    }];
}

- (void)editingHelper:(float)bill {
    float tipPercentage = self.tipSlider.value;
    float tip = bill*tipPercentage;
    float total = bill + tip;
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.percentageLabel.text = [NSString stringWithFormat:@"%.1f%s", self.tipSlider.value*100, "%"];
}

@end
