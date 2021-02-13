@testable import SwiftRelease
import XCTest

final class ReleaseTests: XCTestCase {
    func testLatestRelease() {
        let release = Release(
            version: Version(1, 0, 0),
            platform: .init(platform: .iOS, version: .init("13.0")),
            url: nil,
            latestProduction: nil
        )
        XCTAssertTrue(release.isLatestProduction)
    }

    static var allTests = [
        ("testLatestRelease", testLatestRelease)
    ]
}
