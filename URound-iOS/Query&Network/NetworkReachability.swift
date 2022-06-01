//
//  NetworkManager.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 14.04.2022.
//

import Foundation
import Network



class NetworkReachability: ObservableObject {
    let monitor = NWPathMonitor();
    let MonitorQueue = DispatchQueue(label: "monitor");
    @Published var isConnected = true;
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
            
        }
        monitor.start(queue: MonitorQueue);
    }
}
