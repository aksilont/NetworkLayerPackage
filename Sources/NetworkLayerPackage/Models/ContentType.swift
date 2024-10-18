//
//  ContentType.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

/// Content type.
public enum ContentType {
	/// JSON data.
	case json
	/// Text file in markdown format.
	case markdown
	/// Encoded data transmitted in a GET request.
	case urlencoded
	/// Multi part data.
	case multipart(boundary: String)
	/// JPEG format image.
	case jpeg
	/// PNG format image.
	case png
	
	/// Returns the content type value for transmission in the HTTP header.
	public var value: String {
		switch self {
		case .json:
			return "application/json"
		case .markdown:
			return "text/markdown"
		case .urlencoded:
			return "application/x-www-form-urlencoded"
		case .multipart(let boundary):
			return "multipart/form-data; boundary=\(boundary)"
		case .jpeg:
			return "image/jpeg"
		case .png:
			return "image/png"
		}
	}
}
