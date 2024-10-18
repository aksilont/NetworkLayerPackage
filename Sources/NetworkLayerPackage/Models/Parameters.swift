//
//  Parameters.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

/// Request parameters.
public enum Parameters {
	/// Parameters are missing.
	case none
	/// Parameters passed in the URL, used in GET requests. Contains parameters as a dictionary.
	case url([String: Any])
	/// JSON request. Contains JSON in the form of a dictionary.
	case json([String: Any])
	/// Content type most commonly used for sending HTML forms with binary data via the POST method.
	/// Contains parameters in the form of a dictionary.
	case formData([String: Any])
	/// Any binary data for sending via the POST method. Contains the data and its data type.
	case data(Data, ContentType)
	
	public var contentType: ContentType? {
		switch self {
		case .none, .url:
			// Since the parameters are missing, content type is nil.
			return nil
		case let .data(_, type):
			return type
		case .formData:
			return .urlencoded
		case .json:
			return .json
		}
	}
}
