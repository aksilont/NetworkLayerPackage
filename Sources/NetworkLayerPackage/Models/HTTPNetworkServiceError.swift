//
//  HTTPNetworkServiceError.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

/// Network layer errors.
public enum HTTPNetworkServiceError: Error {
	/// Network error.
	case networkError(Error)
	/// The server response has an unexpected format.
	case invalidResponse(URLResponse?)
	/// Response status code that falls outside the successful range `(200..<300)`.
	case invalidStatusCode(Int, Data?)
	/// Data is missing.
	case noData
	/// Failed to decode the response.
	case failedToDecodeResponse(Error)
}
