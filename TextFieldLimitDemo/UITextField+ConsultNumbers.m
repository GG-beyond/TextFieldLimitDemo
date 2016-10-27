//
//  UITextField+ConsultNumbers.m
//  AXDL_P2P
//
//  Created by XZF on 15/8/11.
//  Copyright (c) 2015年 All rights reserved.
//

#import "UITextField+ConsultNumbers.h"
BOOL isHaveDian;
@implementation UITextField (ConsultNumbers)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //判断之前的数据是否有小数点，并记录小数点有/无状态。
    if ([textField.text rangeOfString:@"."].location==NSNotFound) {
        isHaveDian=NO;
    }else
    {
        isHaveDian=YES;
    }
    
    if ([string length]>0)//表示添加了新字符
    {
        unichar single=[string characterAtIndex:0];//当前输入的字符
        if ((single >='0' && single<='9') || single=='.')//数据格式正确
        {
            if([textField.text length]==0 && single == '.'){  //首字母不能为小数点
                [textField.text stringByReplacingCharactersInRange:range withString:@""];
                return NO;
            }else if([textField.text length]==1 ){ //首字母如果是0，接下来只能输入小数点
                if ([textField.text isEqualToString:@"0"]) {
                    if (single=='.') {
                        isHaveDian=YES;
                        return YES;
                    }else{
                        return NO;
                    }
                }else{
                    return YES;
                }
            }
            
            if (single=='.')
            {
                if(!isHaveDian)//text中还没有小数点
                {
                    isHaveDian=YES;
                    return YES;
                }else
                {
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            else
            {
                if (isHaveDian)//存在小数点
                {
                    //判断小数点的位数
                    NSRange ran=[textField.text rangeOfString:@"."];
                    unsigned long tt=range.location-ran.location;
                    if (tt <= 2){
                        return YES;
                    }else{
                        return NO;
                    }
                }
                else
                {
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else //表示删除字符
    {
        return YES;
    }

}
@end
