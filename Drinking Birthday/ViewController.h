//
//  ViewController.h
//  Drinking Birthday
//
//  Created by John Giazlas on 4/11/14.
//  Copyright (c) 2014 John Giazlas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *drinkingAgeTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *birthdayDatePicker;
@property (strong, nonatomic) IBOutlet UILabel *isOkorNotLabel;

@property (nonatomic) int drinkingAge;

- (IBAction)updateButtonPressed:(UIButton *)sender;
- (IBAction)autoButtonPressed:(UIButton *)sender;

@end

