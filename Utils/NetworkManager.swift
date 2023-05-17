//
//  NetworkManager.swift
//  CookCookMom
//
//  Created by 박승찬 on 2023/05/15.
//

import Foundation
import Network // Let's import Network
class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    
    @Published var isConnected = true
    @Published var isntConnected = false
    
    // Image depends the network status.
    var imageName: String {
        return isConnected ? "wifi" : "wifi.slash"
    }
    
    // Text depends on the network status.
    var connectionDescription: String {
        if isConnected {
            return "Internet connection looks good!"
        } else {
            return "It looks like you're not connected to the internet"
        }
    }
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
                self.isntConnected = !self.isConnected
            }
        }
        
        monitor.start(queue: queue)
    }
    
    // method working when you touch 'Check Status' button.
    func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            self.isntConnected = !self.isConnected
            if path.usesInterfaceType(.wifi) {
                print("Using wifi")
            } else if path.usesInterfaceType(.cellular) {
                print("Using cellular")
            }
        }
    }
    
    // method stop checking.
    func stopMonitoring() {
        monitor.cancel()
    }
}
