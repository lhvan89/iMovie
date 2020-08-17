//
//  ViewController.swift
//  iMovie
//
//  Created by Van Le on 8/2/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import UIKit
//import Foundation

class Settings: NSObject {
    static var wishList: [Item] {
        get {
            if let data = UserDefaults.standard.object(forKey: "kWishList") as? NSData {
                return NSKeyedUnarchiver.unarchiveObject(with: data as Data) as? [Item] ?? []
            }
            return []
        }
        set {
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: newValue), forKey: "kWishList")
            UserDefaults.standard.synchronize()
        }
    }
}

class Item : NSObject, NSCoding {
    
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "kItemId")
        coder.encode(name, forKey: "kItemName")
    }

    required init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeInteger(forKey: "kItemId")
        name = aDecoder.decodeObject(forKey: "kItemName") as? String ?? ""
    }
}


class ViewController: UIViewController {

    var listItem: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get Wish List
        listItem = Settings.wishList
        
        listItem.append(Item(id: 1, name: "iPhone 7 Plus"))
        listItem.append(Item(id: 2, name: "Macbook Pro"))
        
        // Set Wish List
        Settings.wishList = listItem
        
        print(Settings.wishList)
    }
}
