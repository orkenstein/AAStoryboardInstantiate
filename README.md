# AAStoryboardInstantiate ![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)

[![Version](http://cocoapod-badges.herokuapp.com/v/AAStoryboardInstantiate/badge.png)](http://cocoadocs.org/docsets/AAStoryboardInstantiate)
[![Platform](http://cocoapod-badges.herokuapp.com/p/AAStoryboardInstantiate/badge.png)](http://cocoadocs.org/docsets/AAStoryboardInstantiate)

## Usage

1. Add `#import <UIViewController+instantiate.h>` anywhere you need. Your `.pch` file is the best place.
2. Set Storyboard ID for View Controller you want to use. For example `@"MyCoolHomeScreen"`.![Storyboard ID](https://raw.githubusercontent.com/orkenstein/AAStoryboardInstantiate/master/Images/StoryboardID.png)
3. Now you can simply instantiate View Controllers right from your storyboards using this code:
```
- (void)someAction {
    MyCustomVC *customVC = [MyCustomVC instantiateWithIdentifier:@"MyCoolHomeScreen"];
    //  Do something
    [self presentViewController:customVC animated:YES completion:nil];
}
```
...OR set Storyboard ID the same as your class name. For example `@"MyCustomVC"`. And use this method:
```
- (void)someAction {
    MyCustomVC *customVC = [MyCustomVC instantiateFromStoryboard];
    //  Do something
    [self presentViewController:customVC animated:YES completion:nil];
}
```


## Requirements

Works with iOS 7+. ARC compatible.

## Installation

AAStoryboardInstantiate is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "AAStoryboardInstantiate"
    
And run `pod install` or `pod update`

## Author

orkenstein, orkru666@gmail.com

## License

AAStoryboardInstantiate is available under the MIT license. See the LICENSE file for more info.

