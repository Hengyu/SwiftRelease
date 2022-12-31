# SwiftRelease

`SwiftRelease` is a package focused on application release model build upon Swift platform.

We build `SwiftRelease` as a shared library which could be used in both client side and server side. For example, the server produces one `release` value, then the client consumes this value; with `SwiftRelease` they can both leverage the same foundation model for value encoding and decoding (e.g., encode into `JSON` type).

## Installation

`SwiftRelease` could be installed via [Swift Package Manager](https://www.swift.org/package-manager/). Open Xcode and go to **File** -> **Add Packages...**, search `https://github.com/hengyu/SwiftRelease.git`, and add the package as one of your project's dependency.

## Acknowledgements

`SwiftRelease` borrows concept and code from [Swift Package Manager](https://github.com/apple/swift-package-manager). *Swift Package Manager* is licensed under [Apache License v2.0](https://swift.org/LICENSE.txt) with Runtime Library Exception.

## License

`SwiftRelease` is licensed under [Apache License v2.0](LICENSE).
