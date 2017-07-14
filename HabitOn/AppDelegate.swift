//
//  AppDelegate.swift
//  HabitOn
//
//  Created by Danil on 08.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit
import SwiftyBeaver
import LocalizationKit

let beaverLog = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //d3a270d6-68d1-4b0c-848e-95936384ff20
        // add log destinations. at least one is needed!
        let console = ConsoleDestination() // log to Xcode Console
        let file = FileDestination() // log to default swiftybeaver.log file
        let platform = SBPlatformDestination(appID: "5309vA", appSecret: "4qxmsmgfnjYPoElx61s09qmm1rpi3hmz", encryptionKey: "d0p3aW3i6pekpuuhbtz0nb9slk81x3ka")
        beaverLog.addDestination(console)
        beaverLog.addDestination(file)
        beaverLog.addDestination(platform)
        
        //add LocalizationKit support
        
        // DEFINING APP SETTINGS DEFAULTS
        var appDefaults = Dictionary<String, AnyObject>()
        appDefaults["live_localization"] = true as AnyObject?
        UserDefaults.standard.register(defaults: appDefaults)
        UserDefaults.standard.synchronize()
        
        Localization.ifEmptyShowKey = true
        Localization.start(appKey: "d3a270d6-68d1-4b0c-848e-95936384ff20", useSettings: true)
        Localization.availableLanguages { (languages) in
            print("Languages");
        }

        let homeDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String
        
        beaverLog.debug(homeDir)
        
        return true
    }
}

