//
//  INetworkRequest.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

/// Protocol for creating network requests.
public protocol INetworkRequest {
	/// Request path.
	var path: String { get }
	/// HTTP method indicating the type of request.
	var method: HTTPMethod { get }
	/// HTTP header.
	var header: HTTPHeader? { get }
	/// Request parameters.
	var parameters: Parameters { get }
}

/// Extension with an empty HTTP header for the convenience of creating requests without a header.
extension INetworkRequest {
	/// Default value of HTTPHeaders.
	public var header: HTTPHeader? { nil }
}
