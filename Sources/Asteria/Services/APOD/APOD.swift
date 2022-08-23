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

    let title: String
    let explanation: String
    let url: String
    let hdurl: String?
    let date: Date
    let mediaType: MediaType
    let thumbnailUrl: String?
    let copyright: String?
    let serviceVersion: String?

    // let resources: TODO: Add resources
    // let conceptTags TODO: Add concepts
    // let concepts: Concepts? TODO: Add concepts
}
