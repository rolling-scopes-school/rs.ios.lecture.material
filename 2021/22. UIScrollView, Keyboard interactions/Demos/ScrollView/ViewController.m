#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    // Do any additional setup after loading the view.
    [self  subscribeForKeyboardNotifications];
}

- (void)setupImage {
    UIImage *img = [UIImage imageNamed:@"forest"];
       UIImageView *imgView = [[UIImageView alloc] initWithImage:img];

       [self.scrollView addSubview:imgView];
       self.scrollView.contentSize = img.size;

       // Zooming
       self.scrollView.minimumZoomScale = 0.1;
       self.scrollView.maximumZoomScale = 2;
}

- (void)subscribeForKeyboardNotifications {
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keyboardWillHide:)
                                               name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSLog(@"%@", notification);
    CGRect keyboardRect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [self.scrollView setContentInset:UIEdgeInsetsMake(0, 0, keyboardRect.size.height - self.view.safeAreaInsets.bottom + 10, 0)];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [self.scrollView setContentInset:UIEdgeInsetsZero];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"content offset: %@", NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"Start dragging");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"End");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"End dragging");
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"End scrolling animation");
}

// Zooming
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    return scrollView.subviews.firstObject;
//}

@end
