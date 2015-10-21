# SwiftPlugin-God

## Requirements

- iOS 8.0+ / Mac OS X 10.9+ / watchOS 2


## Install

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build Alamofire 3.0.0+.

To integrate SwiftPlugin-God into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'SwiftPlugin-God'
```

Then, run the following command:

```bash
$ pod install
```

## Usage

###with Parameters
```swift
let params :[String:AnyObject!] = [ "a":"a", "b":"b" ]
callapi("http://www.google.com", .POST, params) { (result) -> () in
  print("\(__FUNCTION__) " + result.description)
  print(result)
}
```

###without Parameters
```swift
callapi("http://www.google.com", .POST) { (result) -> () in
  print("\(__FUNCTION__) " + result.description)
  print(result)
}
```
