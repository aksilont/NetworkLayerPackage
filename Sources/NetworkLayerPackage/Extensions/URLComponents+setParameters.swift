//
//  URLComponents+setParameters.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

extension URLComponents {
	/// Sets parameters as a dictionary of type [String: Any] and returns a new URLComponents structure.
	/// - Parameter parameters: Parameters for URLComponents.
	/// - Returns: A new URLComponents structure with the set parameters.
	public func setParameters(_ parameters: [String: Any]) -> URLComponents {
		var urlComponents = self
		urlComponents.queryItems = parameters.map { URLQueryItem(name: $0, value: String(describing: $1)) }
		return urlComponents
	}
}
