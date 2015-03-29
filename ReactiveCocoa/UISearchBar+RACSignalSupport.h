//
//  UISearchBar+RACSignalSupport
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface UISearchBar (RACSignalSupport)  <UISearchBarDelegate>

- (RACSignal *)rac_textSignal;

@end
