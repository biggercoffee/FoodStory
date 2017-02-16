//
//  NHLBViewPictureCell.m
//  NHLBView
//
//  Created by London on 2017/2/8.
//  Copyright © 2017年 NiuHu. All rights reserved.
//

#import "NHLBViewPictureCell.h"

@interface NHLBViewPictureCell ()
@property (strong, nonatomic) UIImageView * imageView;
@property (strong, nonatomic) UILabel     * textLabel;
@end

@implementation NHLBViewPictureCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initWithUI];
    }
    return self;
}

- (void)initWithUI{
    [self addSubview:self.imageView];
    [self addSubview:self.textLabel];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _textLabel.frame = CGRectMake(0, self.bounds.size.height-20,self.bounds.size.width/3.0, 20);
}
- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.clipsToBounds = YES;
        _imageView = imageView;
    }
    return _imageView;
}
- (UILabel *)textLabel{
    if (!_textLabel) {
        UILabel *textLabel = [[UILabel alloc]init];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel = textLabel;
    }
    return _textLabel;
}
@end
