//
//  AppDelegate.swift
//  TinkoffChat
//
//  Created by Furycateur on 20.09.17.
//  Copyright © 2017 Fury. All rights reserved.
//

import UIKit

enum ApplicationStateInfo: String {
    case active = "Active"
    case inactive = "Inactive"
    case background = "Background"
    
    init(state: UIApplicationState) {
        switch state {
        case .active:
            self = .active
        case .inactive:
            self = .inactive
        case .background:
            self = .background
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var applicationStateInfo: ApplicationStateInfo = .inactive {
        didSet {
            print("Application moved from \(oldValue) to \(applicationStateInfo) state")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let state = UIApplication.shared.applicationState
        self.applicationStateInfo = ApplicationStateInfo(state: state)
        print( "State was changed in: \(#function)")

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let state = UIApplication.shared.applicationState
        self.applicationStateInfo = ApplicationStateInfo(state: state)
        print( "State was changed in: \(#function)")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        let state = UIApplication.shared.applicationState
        self.applicationStateInfo = ApplicationStateInfo(state: state)
        print( "State was changed in: \(#function)")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        let state = UIApplication.shared.applicationState
        self.applicationStateInfo = ApplicationStateInfo(state: state)
        print( "State was changed in: \(#function)")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        let state = UIApplication.shared.applicationState
        self.applicationStateInfo = ApplicationStateInfo(state: state)
        print( "State was changed in: \(#function)")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        let state = UIApplication.shared.applicationState
        self.applicationStateInfo = ApplicationStateInfo(state: state)
        print( "State was changed in: \(#function)")
    }
}

