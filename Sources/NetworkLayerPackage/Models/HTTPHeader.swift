//
//  HTTPHeader.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

public typealias HTTPHeader = [String: String]

/// HTTP header fields.
///	Contains a list of commonly used header fields to eliminate hardcoding and avoid typos in field names.
public enum HeaderField {
	/// Authorization, contains the token and is used for OAuth2 authentication.
	case authorization(Token)
	/// Content type.
	case contentType(ContentType)
	
	/// Header key name.
	public var key: String {
		switch self {
		case .authorization:
			return "Authorization"
		case .contentType:
			return "Content-Type"
		}
	}
	
	/// Header field value.
	public var value: String {
		switch self {
		case .authorization(let token):
			return "Bearer \(token.rawValue)"
		case .contentType(let contentType):
			return contentType.value
		}
	}
}
