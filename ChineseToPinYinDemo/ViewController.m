//
//  ViewController.m
//  ChineseToPinYinDemo
//
//  Created by Will on 14-6-23.
//  Copyright (c) 2014年 Will. All rights reserved.
//

#import "ViewController.h"
#import "ChineseToPinYinTool.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISwitch *haveSoundMark;
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    [self putPinYinToResultLabel];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (IBAction)SwitchValueChanged:(id)sender {
    [self putPinYinToResultLabel];
}


- (void)putPinYinToResultLabel
{
    NSString *resultText = [ChineseToPinYinTool pinYinStringFromChinese:self.inputTextView.text hasSoundMark:self.haveSoundMark.isOn];
     self.resultLabel.text = resultText;
}

@end
