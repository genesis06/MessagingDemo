//
//  ViewController.swift
//  MessagingDemo
//
//  Created by Genesis Salazar Barquero on 10/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.displayMessage(notification:)),
                                               name: Notification.Name("FCMNotification"), object: nil)
       
       
    }
    
    
    @IBAction func openURL(_ sender: UIButton) {
        
        let url = URL(string: "messagingApp:Vacation?message=URL_abierto_desde_la_aplicacion")
        
        UIApplication.shared.open(url!) { (result) in
            if result {
                // The URL was delivered successfully!
                print(result)
            }
        }
    }
    
    
    @objc func displayMessage(notification: NSNotification){
        
        guard let userInfo = notification.userInfo else {return}
        
        if let message = userInfo["message"] as? String{
            
           
            let messageAlert = UIAlertController(title: "Notificación", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            messageAlert.addAction(okAction)
            present(messageAlert, animated: true)
        }
        
        
    }


}

