//
//  NetworkMonitor.swift
//  NetworkLayerPackage
//
//  Created by Aksilont on 18.10.2024.
//

import Foundation
import Network

/// Network connection monitoring.
public protocol INetworkMonitor {
	/// A property indicating the presence of a network connection.
	var isConnected: Bool { get }
	/// Type of network connection.
	var connectionType: ConnectionType { get }
	
	/// Starting network monitoring.
	func start()
	/// Stopping network monitoring.
	func stop()
}

/// Type of network connection.
public enum ConnectionType {
	/// Connection via wireless interface.
	case wifi
	/// Connection via cellular network.
	case cellular
	/// Connection via wired interface.
	case ethernet
	/// Unknown connection source or no connection.
	case unknown
	
	init(_ path: NWPath) {
		if path.usesInterfaceType(.wifi) {
			self = .wifi
		} else if path.usesInterfaceType(.cellular) {
			self = .cellular
		} else if path.usesInterfaceType(.wiredEthernet) {
			self = .ethernet
		} else {
			self = .unknown
		}
	}
}

/// Network connection monitoring. Implemented as a Singleton, it is recommended to pass it only as a dependency.
public final class NetworkMonitor: INetworkMonitor {
	/// Network monitoring instance.
	static let shared = NetworkMonitor()

	public private(set) var isConnected: Bool
	public private(set) var connectionType: ConnectionType
			
	// MARK: - Dependencies
	private let queue = DispatchQueue.global()
	private let monitor: NWPathMonitor
	
	// MARK: - Initialization
	private init() {
		self.monitor = NWPathMonitor()
		self.isConnected = false
		self.connectionType = .unknown
	}
	
	// MARK: - Public methods
	public func start() {
		monitor.start(queue: queue)
		monitor.pathUpdateHandler = { [weak self] path in
			self?.isConnected = path.status != .unsatisfied
			self?.connectionType = ConnectionType(path)
		}
	}

	public func stop() {
		monitor.cancel()
	}
}
