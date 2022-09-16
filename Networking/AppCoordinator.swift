//
//  AppCoordinator.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 06/09/2022.
//

import Foundation
import UIKit

class AppCoordinator {
    
    var navigationController: UINavigationController?
    
    
    func start()-> UINavigationController {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    navigationController = sb.instantiateViewController(withIdentifier: "navController") as? UINavigationController
        guard let navigationController = navigationController else{
            return UINavigationController()
        }
        let loginVc = navigationController.viewControllers.first as? LoginViewController
        loginVc?.coordinator = self
        
        return navigationController
}
    
    func navigateToRoomsList(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let roomsList = sb.instantiateViewController(withIdentifier: "RoomsViewController") as? RoomsViewController
        guard let roomsList = roomsList else{
            return
        }
        roomsList.roomViewModel = RoomViewModel(networkManager: RoomsNetworkManager())

        navigationController?.pushViewController(roomsList, animated: true)
            
    }
//    var navController: UINavigationController!
//
//    func start()-> UINavigationController {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let navController =
//        sb.instantiateViewController(withIdentifier: "navController") as! UINavigationController
//        let roomsViewController = navController.viewControllers.first as? RoomsViewController
//        roomsViewController?.roomViewModel = RoomViewModel(networkManager: RoomsNetworkManager())
//        return navController
//    }
//
}
