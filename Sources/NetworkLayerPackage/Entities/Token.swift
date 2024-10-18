//
//  Token.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

/// Authorization token.
public struct Token: MaskStringConvertible {
	/// Value of the authorization token.
	let rawValue: String

	// MARK: - Initialization
	public init(_ rawValue: String) {
		self.rawValue = rawValue
	}
}
