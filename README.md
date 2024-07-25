# FlyreelFNOL

[![Swift 5.10 Supported](https://img.shields.io/badge/Swift-5.10-green.svg)](https://github.com/apple/swift) [![iOS 13](https://img.shields.io/badge/iOS-13+-orange.svg)](https://apple.com)

FlyreelFNOL is a Swift framework for capturing video, handling the entire flow from onboarding, recording, and previewing the video to providing the local file URL path of the final captured video file. This framework supports integration via CocoaPods and Swift Package Manager, and can be used in both SwiftUI and UIKit codebases.

## Features

- SwiftUI/UIKit support
- Onboarding flow
- Video recording
- Video preview
- Local path to stored video file

## Installation

### CocoaPods
To integrate FlyreelFNOL into your Xcode project using CocoaPods, specify it in your Podfile:

```
pod 'FlyreelFNOL'
```

Then, run the following command:

```
pod install
```

### Swift Package Manager

1. Follow the [Apple guide](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app) to add the package dependency to your app.
2. Search for the `https://github.com/Flyreel/flyreel-fnol-ios` package.

## Usage

### SwiftUI Example

To use `FNOLCaptureView` in a SwiftUI codebase:

```swift
import SwiftUI
import FlyreelFNOL

struct ContentView: View {
    @State private var recordedVideoURL: URL?
    @State private var isPresentingCaptureView = false

    var body: some View {
        Button {
            isPresentingCaptureView = true
        } label: {
            Text("Start Capture")
        }
        .compatibleFullScreen(isPresented: $isPresentingCaptureView) {
            FNOLCaptureView(clientID: "YOUR CLIENT ID") { url in
                if let url {
                    // Handle the recorded video URL
                    print("Recorded video URL: \(url)")
                } else {
                    print("Recording was not completed")
                }
                isPresentingCaptureView = false
            }
        }
    }
}
```

### UIKit Example

To use `FNOLCaptureView` in a UIKit codebase:

```swift
import UIKit
import FlyreelFNOL

class ViewController: UIViewController {
    @IBAction func showFNOLCaptureFlow(_ sender: UIButton) {
        self.presentFNOLCaptureView(clientID: "YOUR CLIENT ID") { recordedVideoURL in
            if let url = recordedVideoURL {
                // Handle the recorded video URL
                print("Recorded video URL: \(url)")
            } else {
                print("Recording was not completed")
            }
        }
    }
}
```

#### FNOLCaptureView

`FNOLCaptureView` is a SwiftUI view for capturing video. It provides a completion handler that returns the local file path of the recorded video when the user taps the upload button.

### Initializer

```swift
public init(
    clientID: String,
    onCaptureCompletion: ((URL?) -> Void)? = nil
)
```

- `clientID`: A client ID to validate and enable usage of this module.
- `onCaptureCompletion`: A closure to be executed when the user uploads the recorded video. The closure takes the local URL of the recorded video as its parameter.

## Permissions

To use the camera and microphone in your app, you need to add the following keys to your app's `Info.plist` file:

- `NSCameraUsageDescription`: A message that tells the user why your app needs access to the camera.
- `NSMicrophoneUsageDescription`: A message that tells the user why your app needs access to the microphone.

Here is an example of those keys and values:

```
<key>NSCameraUsageDescription</key>
<string>We need access to the camera to record videos for the FNOL capture process.</string>
<key>NSMicrophoneUsageDescription</key>
<string>We need access to the microphone to record audio along with the video for the FNOL capture process.</string>
```
