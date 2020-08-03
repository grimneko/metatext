// Copyright © 2020 Metabolist. All rights reserved.

import Foundation

protocol MastodonEndpoint {
    associatedtype ResultType: Decodable
    var APIVersion: String { get }
    var context: [String] { get }
    var pathComponentsInContext: [String] { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
}

extension MastodonEndpoint {
    var defaultContext: [String] {
        ["api", APIVersion]
    }

    var APIVersion: String { "v1" }

    var context: [String] {
        defaultContext
    }

    var pathComponents: [String] {
        context + pathComponentsInContext
    }

    var encoding: ParameterEncoding {
        switch method {
        case .get: return URLEncoding.default
        default: return JSONEncoding.default
        }
    }

    var parameters: [String: Any]? { nil }

    var headers: HTTPHeaders? { nil }
}
