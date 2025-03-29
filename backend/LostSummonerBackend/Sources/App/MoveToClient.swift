//
//  MoveToClient.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

/*
 /// In AppDelegate
 NotificationCenter.default.addObserver(
     self,
     selector: #selector(appWillResignActive),
     name: UIApplication.willResignActiveNotification,
     object: nil
 )
 
 @objc func appWillResignActive() {
     let timestamp = Date().timeIntervalSince1970
     UserDefaults.standard.set(timestamp, forKey: "lastOfflineTime")
 }

 //On resume or launch
 let now = Date().timeIntervalSince1970
 let lastOffline = UserDefaults.standard.double(forKey: "lastOfflineTime")
 let offlineDuration = now - lastOffline

 // Send this to your API
 POST /me/regen
 Body: { "offlineDuration": 1478 }


 */
