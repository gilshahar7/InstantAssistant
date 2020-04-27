@interface OPAVoicePlateController
-(void)didTapOnGlifView;
@end

%hook OPAVoicePlateController
-(OPAVoicePlateController *)init{
	OPAVoicePlateController *origself = %orig;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC));
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapOnGlifView) name:UIApplicationDidBecomeActiveNotification object:nil];
		[self didTapOnGlifView];
	});
	return origself;
}
%end
