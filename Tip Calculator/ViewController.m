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

@property (weak, nonatomic) IBOutlet UILabel *totalStaticLabel;

@property (weak, nonatomic) IBOutlet UILabel *tipStaticLabel;

@property (weak, nonatomic) IBOutlet UILabel *splitCost;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tipSlider.value = 0.1;
    
    self.billField.text = @"";
    self.billField.placeholder = @"Total Bill";
    self.billField.adjustsFontForContentSizeCategory = YES;

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
    if ([self.billField.text length] == 0) {
        self.totalLabel.text = [NSString stringWithFormat:@"$0.00"];
        self.tipLabel.text = [NSString stringWithFormat:@"$0.00"];
    } else {
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
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y, self.billField.frame.size.width, self.billField.frame.size.height - 36 );
        CGRect newframe = self.totalLabel.frame;
        newframe.origin.y -= 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.totalLabel.frame = newframe;
        }];
        newframe = self.totalStaticLabel.frame;
        newframe.origin.y -= 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.totalStaticLabel.frame = newframe;
        }];
        newframe = self.tipSlider.frame;
        newframe.origin.y -= 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.tipSlider.frame = newframe;
        }];
        newframe = self.tipStaticLabel.frame;
        newframe.origin.y -= 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.tipStaticLabel.frame = newframe;
        }];
        newframe = self.tipLabel.frame;
        newframe.origin.y -= 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.tipLabel.frame = newframe;
        }];
        newframe = self.percentageLabel.frame;
        newframe.origin.y -= 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.percentageLabel.frame = newframe;
        }];
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    [UIView animateWithDuration:0.7 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y, self.billField.frame.size.width, self.billField.frame.size.height + 36 );
        
        CGRect newframe = self.totalLabel.frame;
        newframe.origin.y += 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.totalLabel.frame = newframe;
        }];
        newframe = self.totalStaticLabel.frame;
        newframe.origin.y += 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.totalStaticLabel.frame = newframe;
        }];
        newframe = self.tipSlider.frame;
        newframe.origin.y += 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.tipSlider.frame = newframe;
        }];
        newframe = self.tipStaticLabel.frame;
        newframe.origin.y += 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.tipStaticLabel.frame = newframe;
        }];
        newframe = self.tipLabel.frame;
        newframe.origin.y += 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.tipLabel.frame = newframe;
        }];
        newframe = self.percentageLabel.frame;
        newframe.origin.y += 85;
        [UIView animateWithDuration:0.7 animations:^{
            self.percentageLabel.frame = newframe;
        }];
    }];
    
    if ([self.billField.text length] != 0) {
        self.billField.text = [NSString stringWithFormat: @"$%.2f", [self.billField.text doubleValue]];
    }
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
