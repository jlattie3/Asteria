//
//  HTTPService.swift
//  
//
//  Created by Jacob Lattie on 8/21/22.
//

import Foundation

public protocol HTTPService {
    var session: URLSession { get }
}

public enum HTTPError: Error {
    case invalidUrl
    case error(Error?)
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension HTTPService {
    func call(endpoint: Endpoint) async throws -> Data {
        do {
            guard let request = endpoint.urlRequest() else { throw HTTPError.invalidUrl }
            let (data, _) = try await session.data(for: request)
            // TODO: Handle more response codes
            print("--------")
            print(request.url)
            print(String(data: data, encoding: .utf8)!)
            return data
        } catch {
            // TODO: More error handling
            throw HTTPError.error(error)
        }
    }
}

extension Bool {
    func asQueryString() -> String {
        return String(self).capitalized
    }
}
