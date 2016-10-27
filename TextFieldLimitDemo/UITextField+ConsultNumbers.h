//
//  UITextField+ConsultNumbers.h
//  AXDL_P2P
//
//  Created by XZF on 15/8/11.
//  Copyright (c) 2015年 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ConsultNumbers)

//只能输入数字、小数点（第一位数若是0，后面只能输入小数点;第一位不能是小数点），且小数点后面只能是2位
//正确输入:833.00
//错误输入:08   123.123    .88
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;


@end
