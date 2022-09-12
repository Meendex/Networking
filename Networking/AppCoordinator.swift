//
//  AppCoordinator.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 06/09/2022.
//

import Foundation
import UIKit

class AppCoordinator {
    
    var navController: UINavigationController!
    
    func start()-> UINavigationController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let navController =
        sb.instantiateViewController(withIdentifier: "navController") as! UINavigationController
        let roomsViewController = navController.viewControllers.first as? RoomsViewController
        roomsViewController?.roomViewModel = RoomViewModel(networkManager: RoomsNetworkManager())
        return navController
    }
        
//        navController = sb.instantiateViewController(withIdentifier: "navController") as? UINavigationController
//        let vc = navController.viewControllers.first as? RoomsViewController
//        vc?.coordinator = self
//        return navController
//    }
}
