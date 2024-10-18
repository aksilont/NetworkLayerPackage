//
//  MaskStringConvertible.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation

/// Mask for hiding the property in debugging and documentation.
public protocol MaskStringConvertible: CustomStringConvertible, CustomDebugStringConvertible { }

public extension MaskStringConvertible {
	var description: String { "***********" }
	var debugDescription: String { "***********" }
}
