#import "UISearchBar+RACSignalSupport.h"
#import <objc/runtime.h>
#import "NSObject+RACDescription.h"

@implementation UISearchBar (RACSignalSupport)

- (RACSignal *)rac_textSignal {
    self.delegate = self;
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (signal) {
        return signal;
    }
    signal = [[[[self rac_signalForSelector:@selector(searchBar:textDidChange:)
                               fromProtocol:@protocol(UISearchBarDelegate)]
                map:^id(RACTuple *tuple) {
                    return tuple.second;
                }]
               distinctUntilChanged]
              setNameWithFormat:@"%@ -rac_textSignal", self.rac_description];
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return signal;
}

@end
