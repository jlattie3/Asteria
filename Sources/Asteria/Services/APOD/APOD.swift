//
//  APOD.swift
//  
//
//  Created by Jacob Lattie on 8/21/22.
//

import Foundation

public struct APOD: Decodable {
    public enum MediaType: String, Codable {
        case image, video
    }

    public let title: String
    public let explanation: String
    public let url: String
    public let hdurl: String?
    public let date: Date
    public let mediaType: MediaType
    public let thumbnailUrl: String?
    public let copyright: String?
    public let serviceVersion: String?

    // let resources: TODO: Add resources
    // let conceptTags TODO: Add concepts
    // let concepts: Concepts? TODO: Add concepts
}
