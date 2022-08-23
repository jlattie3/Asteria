//
//  Endpoint.swift
//  
//
//  Created by Jacob Lattie on 8/21/22.
//

import Foundation

public enum HTTPMethod: String {
    case get, post, put, delete, patch, head
}

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters { get }
}

extension Endpoint {
    public typealias Parameters = [String: String]

    func endpointUrl() -> URL? {
        var components = URLComponents(string: path)
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url
    }

    func urlRequest() -> URLRequest? {
        guard let url = endpointUrl() else { return nil } // Throw error here instead !!!
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        return request
    }
}
