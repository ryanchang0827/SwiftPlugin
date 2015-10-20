//
//  ExtViewController.swift
//
//  Created by Ryan on 2015/9/4.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

extension UIViewController {
    NSLocalizedStringFromTableInBundle(@"OK", @"Parse",
    [NSBundle bundleForClass:[self class]],
    @"Default alert view cancel button title.");
    
    func showProgress() {
        let loadingNotification = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.Indeterminate
        loadingNotification.labelText = NSLocalizedString("MSG_Loading", comment: "Loading...")
        loadingNotification.labelText = NSLocalizedString("MSG_Loading", tableName: "GodPlugin", bundle: <#T##NSBundle#>, value: <#T##String#>, comment: "載入中")
//        self.statusBarHUDForegroundColor = UIColor.colorFromCode(0x167EFB) // iOS7 Safari bar color
//        self.showStatusBarHUD()
    }
    
    func hideProgress() {
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
        
//        self.hideStatusBarHUD()
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: NSLocalizedString("CM_Error", comment: "錯誤"), message: NSLocalizedString("MSG_Disconnected", comment: "無法連線至網際網路"), preferredStyle: .Alert)
        
        let Action = UIAlertAction(title: NSLocalizedString("CM_Confirm", comment: "確定"), style: .Default) { action in
            self.hideProgress()
        }
        alert.addAction(Action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showRetry() {
        let alert = UIAlertController(title: NSLocalizedString("CM_Error", comment: "錯誤"), message: NSLocalizedString("MSG_RETRY", comment: "請稍候再試"), preferredStyle: .Alert)
        
        let Action = UIAlertAction(title: NSLocalizedString("CM_Confirm", comment: "確定"), style: .Default) { action in
            self.hideProgress()
        }
        alert.addAction(Action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showMsgAlert(msg :String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("CM_Confirm", comment: "確定"), style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func callapi (
        apiPath :String,
        _ httpmethod :Alamofire.Method,
        _ parameters :[String: AnyObject]? = nil,
        _ completionHandler: (result :JSON) -> ())
    {
        self.showProgress()
        Alamofire.request(httpmethod, "\(apiPath)", parameters: parameters)
            .responseString { response in
                if response.result.error != nil {
                    NSLog("AlamofireError: \(response.result.error)")
                    self.showErrorAlert()
                } else if let data = response.result.value {
                    var modifyData :String = data
                    modifyData = modifyData.stringByReplacingOccurrencesOfString("<?xml version=\"1.0\" encoding=\"utf-8\"?>", withString: "")
                    modifyData = modifyData.stringByReplacingOccurrencesOfString("<string>", withString: "")
                    modifyData = modifyData.stringByReplacingOccurrencesOfString("</string>", withString: "")
                    
                    if let data = modifyData.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true){
                        
                        completionHandler(result: JSON(data: data))
                    }
                    
                } else {
                    NSLog("AlamofireError: Data Something Wrong")
                    self.showRetry()
                }
                self.hideProgress()
        }
    }
    
}
