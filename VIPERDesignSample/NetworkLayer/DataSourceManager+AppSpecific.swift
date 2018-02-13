/*
 * <Claims Adjust / Insurance>
 * Licensed Materials - Property of IBM
 * Copyright (C) 2016 IBM Corp. All Rights Reserved.
 *
 * IMPORTANT:  This IBM software is supplied to you by IBM
 * Corp. ("IBM") in consideration of your agreement to the following
 * terms, and your use, installation, modification or redistribution of
 * this IBM software constitutes acceptance of these terms. If you do
 * not agree with these terms, please do not use, install, modify or
 * redistribute this IBM software.
 */

import Foundation
import AKNetworking

extension DataSourceManager {
    class func configure() {
        // setup default headers
        let deviceModel = UIDevice.current.model
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        DataSourceManager.addHeaderWithName("Device-Model", value:deviceModel)
        DataSourceManager.addHeaderWithName("App-Version", value:appVersion)
        DataSourceManager.addHeaderWithName("Accept-Language", value:"en-US")

        // setup local mode accordingly
        DataSourceManager.localMode = true

    }
    
    static var baseURL: String {
        if let dataSource = Bundle.main.infoDictionary?["DataSource"] as? [String: AnyObject], let baseURL = dataSource["baseURL"] as? String {
            return baseURL
        }
        return ""
    }
    
    class func pathForServiceName(_ name: String) -> String {
        if let envPaths = Bundle.main.infoDictionary?["DataSource"] as? [String: AnyObject], let paths = envPaths["Paths"] as? [String:String] {
            return paths[name] ?? ""
        }
        return ""
    }
}

extension AKNetworking.Request {
    func challengeHandler(_ handler: @escaping (() -> Void)) -> Self {
        self.delegate.queue.addOperation {
            if self.response?.statusCode == 401 || self.response?.statusCode == 403 {
                DispatchQueue.main.async() {
                    handler()
                }
                
                self.delegate.queue.cancelAllOperations()
            }
        }
        return self
    }
}
