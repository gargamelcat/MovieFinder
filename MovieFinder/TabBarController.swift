//
//  TabBarController.swift
//  MovieFinder
//
//  Created by Albert Avepa on 19/08/15.
//  Copyright (c) 2015 Albert Avepa. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabItems = self.tabBar.items! as [UITabBarItem]
        let tabItem0 = tabItems[0] as UITabBarItem
        let tabItem1 = tabItems[1] as UITabBarItem
        
        tabItem0.title = "Search"
        tabItem1.title = "About"
        
        self.tabBar.tintColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

}
