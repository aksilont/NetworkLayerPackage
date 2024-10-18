//
//  ResponseStatus.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

/// Server response codes to requests.
public enum ResponseStatus {
	/// Informational status.
	case information(Int)
	/// Status of successful request execution.
	case success(Int)
	/// Redirection.
	case redirect(Int)
	/// Client error.
	case clientError(Int)
	/// Server error.
	case serverError(Int)
	
	init?(rawValue: Int) {
		switch rawValue {
		case ResponseCode.informationalCodes:
			self = .information(rawValue)
		case ResponseCode.successCodes:
			self = .success(rawValue)
		case ResponseCode.redirectCodes:
			self = .redirect(rawValue)
		case ResponseCode.clientErrorCodes:
			self = .clientError(rawValue)
		case ResponseCode.serverErrorCodes:
			self = .serverError(rawValue)
		default:
			return nil
		}
	}
	
	/// Returns true if the status was success.
	var isSuccess: Bool {
		switch self {
		case .success:
			return true
		default:
			return false
		}
	}
}

