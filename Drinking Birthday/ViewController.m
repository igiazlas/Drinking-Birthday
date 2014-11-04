//
//  ViewController.m
//  Drinking Birthday
//
//  Created by John Giazlas on 4/11/14.
//  Copyright (c) 2014 John Giazlas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define YEAR_IN_SECONDS 31536000

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Set the drinking age
    self.drinkingAge = 21;
    
    [self updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateButtonPressed:(UIButton *)sender {
    if ([self.drinkingAgeTextField.text isEqualToString:@""]) {
        UIAlertController* alert = [UIAlertController
                                    alertControllerWithTitle:@"Error"
                                    message:@"You didn't enter a year"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        self.drinkingAge = [self.drinkingAgeTextField.text integerValue];
        [self.view endEditing:YES];
        [self updateView];
    }
}

- (IBAction)autoButtonPressed:(UIButton *)sender {
}

#pragma mark - Helper Methods

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate *drinkingAgeYearsAgo = [NSDate dateWithTimeIntervalSinceNow:-[self secondsForYears:self.drinkingAge]];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    if ([datePicker.date timeIntervalSinceDate:drinkingAgeYearsAgo] <= 0) {
        self.isOkorNotLabel.text = @"OK";
        self.isOkorNotLabel.textColor = [UIColor greenColor];
    } else {
        self.isOkorNotLabel.text = @"NOT OK";
        self.isOkorNotLabel.textColor = [UIColor redColor];
    }
}

- (int)secondsForYears:(int)years
{
    return YEAR_IN_SECONDS * years;
}

- (void)updateView
{
    //Set the Date Picer
    int drinkingAgeInSeconds = [self secondsForYears:self.drinkingAge];
    NSDate *drinkingAgeYearsAgo = [NSDate dateWithTimeIntervalSinceNow:-drinkingAgeInSeconds];
    NSDate *currentDate = [NSDate date];
    self.birthdayDatePicker.date = drinkingAgeYearsAgo;
    self.birthdayDatePicker.maximumDate = currentDate;
    [self.birthdayDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    //Set the OK or NOT OK Label
    self.isOkorNotLabel.text = @"OK";
    self.isOkorNotLabel.textColor = [UIColor greenColor];
}

@end