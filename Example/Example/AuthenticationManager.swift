//
//  AuthenticationManager.swift
//  Example
//
//  Created by Sam Symons on 2014-06-10.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

import Foundation
import UIKit

class AuthenticationManager {
    var authenticationSuccessBlock: () -> Void
    
    init() {
        authenticationSuccessBlock = {}
    }
    
    func showSignInAlertView(completion: (() -> Void)) {
        self.authenticationSuccessBlock = completion;
        self.signInAlertView().show();
    }
    
    func signInAlertView() -> UIAlertView {
        let alert = UIAlertView()
        
        alert.title = "Reddit Account"
        alert.message = "Please enter your account credentials."
        alert.alertViewStyle = .LoginAndPasswordInput
        
        alert.addButtonWithTitle("Cancel")
        alert.addButtonWithTitle("Sign In")
        
        return alert
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == 1)
        {
            let username: String = alertView.textFieldAtIndex(0).text
            let password: String = alertView.textFieldAtIndex(1).text
            
            if countElements(username) == 0 || countElements(password) == 0 {
                return
            }
            
            RKClient.sharedClient().signInWithUsername(username, password: password) { (error: NSError!) in
                if (error)
                {
                    let errorAlertView = self.signInAlertView()
                    errorAlertView.message = error.localizedFailureReason;
                    
                    errorAlertView.show()
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue(), self.authenticationSuccessBlock);
                }
            }
        }
    }
}
