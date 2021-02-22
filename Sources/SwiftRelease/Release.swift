//
//  Release.swift
//  
//
//  Created by hengyu on 2021/2/8.
//

import Foundation

/// `Release` value contains necessary info of a certain binary release.
public struct Release: Codable, Equatable, Hashable {
    /// The version info of the release.
    public let version: Version
    /// The target platform of the release.
    public let platform: SupportedPlatform
    /// The URL pointed to the webpage for the release, could be an App Store page.
    public let url: URL?
    /// The latest production release, if any.
    public var latestProduction: TypedRelease?

    /// Whether it is the latest release.
    public var isLatestProduction: Bool {
        latestProduction == nil || latestProduction?.version == version
    }

    public var isAlpha: Bool {
        !version.prereleaseIdentifiers.isEmpty || (latestProduction != nil && version > latestProduction!.version)
    }

    public init(
        version: Version,
        platform: SupportedPlatform,
        url: URL? = nil,
        latestProduction: TypedRelease? = nil
    ) {
        self.version = version
        self.platform = platform
        self.url = url
        self.latestProduction = latestProduction
    }

    public mutating func withLatest(_ release: TypedRelease?) {
        latestProduction = release
    }
}

public enum ReleaseType: String, Codable, Hashable {
    case production
    case beta
}

/// `TypedRelease` does not have the `next` release.
public struct TypedRelease: Codable, Equatable, Hashable {
    /// The version info of the release.
    public let version: Version
    /// The target platform of the release.
    public let platform: SupportedPlatform
    /// The type of the release.
    public let type: ReleaseType
    /// The URL pointed to the webpage for the release, could be an App Store page.
    public let url: URL?

    /// Keep this method to not introduce breaking changes.
    public static func production(version: Version, platform: SupportedPlatform) -> TypedRelease {
        .init(version: version, platform: platform, type: .production, url: nil)
    }

    /// Keep this method to not introduce breaking changes.
    public static func beta(version: Version, platform: SupportedPlatform) -> TypedRelease {
        .init(version: version, platform: platform, type: .beta, url: nil)
    }

    public static func production(version: Version, platform: SupportedPlatform, url: URL?) -> TypedRelease {
        .init(version: version, platform: platform, type: .production, url: url)
    }

    public static func beta(version: Version, platform: SupportedPlatform, url: URL?) -> TypedRelease {
        .init(version: version, platform: platform, type: .beta, url: url)
    }
}
