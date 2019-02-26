# M3U8Kit

[![Build Status](https://travis-ci.org/M3U8Kit/M3U8Parser.svg?branch=master)](https://travis-ci.org/M3U8Kit/M3U8Parser)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/M3U8Kit.svg)](https://img.shields.io/cocoapods/v/M3U8Kit.svg)
[![Platform](https://img.shields.io/cocoapods/p/M3U8Kit.svg?style=flat)](http://cocoadocs.org/docsets/M3U8Kit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

<a id="installation"></a>

## Installation

### [Cocoapods](https://cocoapods.org/)

#### Podfile

To integrate M3U8Kit into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
pod 'M3U8Kit'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate MLSOAppDelegate into your Xcode project using Carthage, specify it in your `Carfile`:

```ogdl
github "M3U8Kit/M3U8Parser" ~> 0.2.1 
```

Run `carthage` to build the framework and drag the built `M3U8Kit.framework` into your Xcode project.

### Manually

If you prefer not to use either of the above mentioned dependency managers, you can integrate `M3U8Kit` into your project manually by adding the files contained in the [Source](https://github.com/M3U8Kit/M3U8Parser/tree/master/Source) folder to your project.

## Usage

- Asynchronous

```objc
#import "NSURL+m3u8.h"

[<#URL#> loadM3U8AsynchronouslyCompletion:^(M3U8PlaylistModel *model, NSError *error) {
                                      }];
```

- Synchronous

```objective-c
NSError *error = nil;
M3U8PlaylistModel *model = [[M3U8PlaylistModel alloc] 
            initWithURL:@"https://xxx.xxx.com/live.m3u8"
              error:&error];
```

## License

M3U8Kit is available under the MIT license. See the LICENSE file for more info.