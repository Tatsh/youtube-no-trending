%hook YTPivotBarView
- (void)layoutSubviews {
    NSString *trendingString = NSLocalizedString(@"Trending", nil);
    Class pivotBarItemViewClass = [%c(YTPivotBarItemView) class];
    for (NSUInteger i = 1; i <= 6; i++) {
        NSString *key = [NSString stringWithFormat:@"itemView%lu", (unsigned long)i];
        id view = [self valueForKey:key];

        if (view && [view class] == pivotBarItemViewClass) {
            UIButton *button = (UIButton *)[view valueForKey:@"navigationButton"];
            if (button && [button.titleLabel.text isEqualToString:trendingString]) {
                [view setValue:@YES forKey:@"hidden"];
            }
        }
    }

    %orig;
}
%end
