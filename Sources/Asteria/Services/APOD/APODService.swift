//
//  APODService.swift
//  
//
//  Created by Jacob Lattie on 8/21/22.
//

import Foundation

public protocol AsteriaAPODService: HTTPService {
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func getAPOD(getConceptTags: Bool, getHdContent: Bool, getThumbnail: Bool) async throws -> APOD

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func getAPOD(with filter: APODService.APODFilter, getConceptTags: Bool, getHdContent: Bool, getThumbnail: Bool) async throws -> [APOD]
}

public struct APODService: AsteriaAPODService {

    public enum APODFilter {
        case date(Date)
        case dateRange(startDate: Date, endDate: Date = Date())
        case random(count: Int)
    }

    public enum API: Endpoint {
        case getAPOD(filter: APODFilter,
                     getConceptTags: Bool,
                     getHDContent: Bool,
                     getThumbnail: Bool)

        private var apiKey: String {
            "DEMO_KEY" // TODO: Hide key
        }

        var httpMethod: HTTPMethod {
            .get
        }

        var baseUrl: String {
            "https://api.nasa.gov/planetary"
        }

        var parameters: Parameters {
            switch self {
            case let .getAPOD(filterOption, getConceptTags, getHDContent, getThumbnail):
                var paramDict = queryParam(for: filterOption)
                paramDict["concept_tags"] = getConceptTags.asQueryString()
                paramDict["hd"] = getHDContent.asQueryString()
                paramDict["thumbs"] = getThumbnail.asQueryString()
                paramDict["api_key"] = apiKey
                return paramDict
            }
        }

        var path: String {
            switch self {
            case .getAPOD:
                return baseUrl + "/apod"
            }
        }

        private func queryParam(for filterOption: APODFilter) -> Parameters {
            switch filterOption {
            case let .date(date):
                return ["date": DateFormatter.yyyy_mm_dd.string(from: date)]
            case let .dateRange(startDate, endDate):
                return ["start_date": DateFormatter.yyyy_mm_dd.string(from: startDate),
                        "end_date": DateFormatter.yyyy_mm_dd.string(from: endDate)]
            case let .random(count):
                return ["count": "\(count)"]
            }
        }
    }

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.yyyy_mm_dd)
        return decoder
    }()

    public var session: URLSession
}

extension APODService {
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func getAPOD(getConceptTags: Bool = false,
                        getHdContent: Bool = true,
                        getThumbnail: Bool = true) async throws -> APOD {
        try await decoder.decode(APOD.self, from: call(endpoint: API.getAPOD(filter: .date(Date()),
                                                                             getConceptTags: getConceptTags,
                                                                             getHDContent: getHdContent,
                                                                             getThumbnail: getThumbnail)))
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func getAPOD(with filter: APODFilter,
                        getConceptTags: Bool = false,
                        getHdContent: Bool = true,
                        getThumbnail: Bool = true) async throws -> [APOD] {
        try await decoder.decode([APOD].self, from: call(endpoint: API.getAPOD(filter: filter,
                                                                               getConceptTags: getConceptTags,
                                                                               getHDContent: getHdContent,
                                                                               getThumbnail: getThumbnail)))
    }
}
