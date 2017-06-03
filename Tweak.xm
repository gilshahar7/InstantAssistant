@interface OPASearchViewController
-(void)didTapOnGlifView;
@end

@interface OPAViewController
@property (nonatomic, assign) OPASearchViewController *searchViewController;
@end

%hook OPAViewController
-(void)viewDidLoad{
	%orig;
	[[NSNotificationCenter defaultCenter] addObserver:self.searchViewController selector:@selector(didTapOnGlifView) name:UIApplicationDidBecomeActiveNotification object:nil];
	[self.searchViewController didTapOnGlifView];
}
%end