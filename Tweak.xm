@interface OPAVoicePlateController
-(void)didTapOnGlifView;
@end

%hook OPAVoicePlateController
-(OPAVoicePlateController *)init{
	OPAVoicePlateController *origself = %orig;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapOnGlifView) name:UIApplicationDidBecomeActiveNotification object:nil];
	[self didTapOnGlifView];
	return origself;
}
%end
