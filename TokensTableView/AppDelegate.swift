//
//  AppDelegate.swift
//  TokensTableView
//
//  Created by msaad on 2/11/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    enum Language: String {
        case ar
        case en
    }
    static let language:Language = Language.ar
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
//    @objc func keyboardWillShow(_ notification: Notification) {
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyboardHeight = keyboardRectangle.origin.y
//            let activeCoordinates = getActiveUIComponentCoordinates()
//            if keyboardHeight-activeCoordinates.y < 30{
//                let topVC = window?.rootViewController
//                let intendedTable = topVC?.view.subviews.first(where: { (view) -> Bool in
//                    return view.isKind(of: UITableView.self)
//                })
//                if intendedTable != nil{
//                    forceScrollTableView(tableView: intendedTable as! UITableView)
//                }
//                
//            }
//        }
//    }
//    
//    func forceScrollTableView(tableView:UITableView){
//        tableView.setContentOffset(CGPoint(x: 0, y: tableView.frame.maxY+20), animated: true)
//    }
//        
//    func getActiveUIComponentCoordinates()->CGPoint{
//        if let activeView=window?.rootViewController?.view.subviews.first(where: { (view) -> Bool in
//            return view.isFirstResponder
//        }){
//            let absoluteCoordinates = activeView.convert(activeView.center, to: activeView.superview?.superview?.superview)
//            return absoluteCoordinates
//        }
//        return CGPoint.zero
//    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }

    // MARK: - Core Data stack

    
    
    static func flipContent(view:UIView){
        if AppDelegate.language == AppDelegate.Language.ar{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            view.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
            view.semanticContentAttribute = .forceRightToLeft
        }
        else{
            view.layer.setAffineTransform(CGAffineTransform(scaleX: 1, y: 1))
            view.semanticContentAttribute = .forceLeftToRight
        }
    }

}

