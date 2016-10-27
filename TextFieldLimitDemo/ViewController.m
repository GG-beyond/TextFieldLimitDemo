//
//  ViewController.m
//  TextFieldLimitDemo
//
//  Created by XZF on 15/8/7.
//  Copyright (c) 2015年 anxindeli. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+ConsultNumbers.h"
@interface ViewController ()<UITextFieldDelegate>
{
    NSString *changeString;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(320, 1000);
    
    self.textfield1.delegate=self;
    [self.textfield1 addTarget:self action:@selector(amountTextFieldEditing:) forControlEvents:UIControlEventEditingChanged];
}
#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    changeString=textField.text;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL isLegal=[textField textField:textField shouldChangeCharactersInRange:range replacementString:string];
    BOOL canChange;
    if (isLegal) {
        canChange=YES;
        NSMutableString *tempStr=[NSMutableString stringWithString:changeString];
        [tempStr replaceCharactersInRange:range withString:string];
        changeString=[NSString stringWithFormat:@"%@",tempStr];
    }
    else{
        canChange=NO;
    }
    return canChange;
}
#pragma mark UITextField selector (如果键盘通过联想输入的话，不会走shouldChangeCharactersInRange 的代理方法，所以添加方法监textfield)
- (void)amountTextFieldEditing:(UITextField *)textField{
    NSString *toBeString = textField.text;
    NSString *lang = [[[UITextInputMode activeInputModes] firstObject] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        if([toBeString length]<=changeString.length){//全部删除文字
            changeString=toBeString;
        }else{
            textField.text=changeString;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
