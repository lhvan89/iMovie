//
//  ViewController.swift
//  iMovie
//
//  Created by Van Le on 8/2/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import UIKit
//import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMenuDashBoard()
        loadDashboardListTrinhKy()
        
    }
    
    func loadMenuDashBoard() {
        APIClient.requestObject(DashBoardRouter.GetDashboardMenu, DashboardMenuModel.self) { [weak self] (data) in
            guard let wself = self else { return }
            if let data = data {
                for i in data.AllMenu {
                    print(i.Title)
                }
            }
        }
    }
    
    func loadDashboardListTrinhKy() {
        APIClient.requestCollection(DashBoardRouter.DashboardListTrinhKy(key: "Menu", pagingInfo: ""), TapMenuModel.self) { (datas) in
            if let datas = datas {
                for i in datas {
                    print(i.Title)
                }
            }
        }
    }
}
