# WWTwelveEqualTemperament

[![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-15.0](https://img.shields.io/badge/iOS-15.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWTwelveEqualTemperament) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

## [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [A small program that generates 12 equal temperament.](https://zh.wikipedia.org/zh-tw/十二平均律)
- [產生十二平均率的小程式。](https://zh.pngtree.com/freebackground/music-dream-piano-training-poster_1129277.html)

![](./Example.png)

## [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)

```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWTwelveEqualTemperament.git", .upToNextMajor(from: "1.0.0"))
]
```

### [Function - 可用函式](https://ezgif.com/video-to-webp)
|函式|功能|
|-|-|
|table(baseFrequency:type:)|產生十二平均率字典|

## Example
```swift
import UIKit
import WWTwelveEqualTemperament

final class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func demo(_ sender: UIButton) {
        if let table = WWTwelveEqualTemperament.shared.table(type: .solfeggio) { label.text = "\(table)" }
    }
}
```
