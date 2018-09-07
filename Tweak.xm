@interface OPASearchViewController
-(void)didTapOnGlifView;
@end

@interface OPAViewController
@property (nonatomic, assign) OPASearchViewController *searchViewController;
@end

@interface OPAZeroStateViewController
-(void)openMicForVoiceQuery;
@end

%hook OPAViewController
-(void)viewDidLoad{
	%orig;
	[[NSNotificationCenter defaultCenter] addObserver:self.searchViewController selector:@selector(didTapOnGlifView) name:UIApplicationDidBecomeActiveNotification object:nil];
	[self.searchViewController didTapOnGlifView];
}
%end



%hook OPAZeroStateViewController
-(void)viewDidLoad{
	%orig;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openMicForVoiceQuery) name:UIApplicationDidBecomeActiveNotification object:nil];
	[self openMicForVoiceQuery];
}
%end
