%hook YTPivotBarView
- (void)layoutSubviews {
    NSString *trendingString = NSLocalizedString(@"Trending", nil);
    for (NSUInteger i = 1; i <= 6; i++) {
        NSString *key = [NSString stringWithFormat:@"itemView%lu", (unsigned long)i];
        id view = nil;
        @try {
            view = [self valueForKey:key];
        }
        @catch (NSException *e) {
            continue;
        }

        if ([view class] == [%c(YTPivotBarItemView) class]) {
            UIButton *button = (UIButton *)[view valueForKey:@"navigationButton"];
            if ([button.titleLabel.text isEqualToString:trendingString]) {
                [view setValue:@YES forKey:@"hidden"];
            }
        }
    }

    %orig;
}
%end