//
//  URLRequestBuilder.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

/// A service that builds a request from NetworkRequest.
protocol IURLRequestBuilder {
	/// Building a URLRequest from NetworkRequest.
	/// - Parameters:
	///   - request: Network request.
	///   - token: Authorization token.
	/// - Returns: Constructed URLRequest.
	func build(forRequest request: INetworkRequest, token: Token?) -> URLRequest
}

/// A service that builds a request from NetworkRequest.
struct URLRequestBuilder: IURLRequestBuilder {
	/// Base URL of the service for which requests will be created.
	var baseUrl: URL

	func build(forRequest request: INetworkRequest, token: Token?) -> URLRequest {
		let url = baseUrl.appendingPathComponent(request.path)
		
		var urlRequest = URLRequest(url: url)
		
		urlRequest.httpMethod = request.method.rawValue
		urlRequest.allHTTPHeaderFields = request.header
		
		urlRequest.add(parameters: request.parameters)
		
		if let contentType = request.parameters.contentType {
			urlRequest.add(header: .contentType(contentType))
		}
		
		if let token = token {
			urlRequest.add(header: .authorization(token))
		}
		
		return urlRequest
	}
}

extension URLRequest {
	mutating func add(header: HeaderField) {
		setValue(header.value, forHTTPHeaderField: header.key)
	}
	
	/// Adding request parameters.
	/// - Parameters:
	///  - parameters: Request parameters.
	mutating func add(parameters: Parameters) {
		switch parameters {
		case .none:
			break
		case .url(let dictionary):
			guard let url = url, var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { break }
			components = components.setParameters(dictionary)
			guard let newUrl = components.url else { break }
			self.url = newUrl
			
		case .json(let dictionary):
			httpBody = try? JSONSerialization.data(withJSONObject: dictionary)
		case .formData(let dictionary):
			httpBody = URLComponents().setParameters(dictionary).query?.data(using: .utf8)
		case .data(let data, _):
			httpBody = data
		}
	}
}
