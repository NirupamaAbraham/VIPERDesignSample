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

enum Request {

    typealias MethodAndPath = (method: AKNetworking.Method, path: String)

    // Authentication
    case authentication()
    
    //Claim Files
    case getClaimFiles() // GET /claimsadjust_claimFile/claim_files?adjusterId={adjuster_id}
    
    //Appointments
    case getAppointments() // GET /claimsadjust_appointment/appointments?adjusterId={adjuster_id}


    
    func execute() -> AKNetworking.Request {
        let methodAndPath = self.methodAndPath
        // build the actual request
        let request: AKNetworking.Request
        
        switch self {
        // Authentication
        case .authentication():
            let data = ["data": ""]
            request = DataSourceManager.request(methodAndPath.method
                                                , methodAndPath.path
                , parameters: data as [String: AnyObject]
                                                , encoding: .json
                                                , headers: self.headers)
      
        // Claim Files
        case .getClaimFiles():
            request = DataSourceManager.request(methodAndPath.method, methodAndPath.path)
            
        //Appointments
        case .getAppointments():
            request = DataSourceManager.request(methodAndPath.method, methodAndPath.path)

        }
    
      
        // log the response
        request.responseString { (urlRequest, urlResponse, string, error) -> Void in
            // use this closure to log the response
        }
        
        // check for challenge handler
        request.challengeHandler { () -> Void in
//            self.authenticationController?.signOut()
        }
        
        return request
        
    }
        
        
    fileprivate var methodAndPath: MethodAndPath {
        
        switch self {
        // Authentication
        case .authentication():
            return (.PUT, pathForServiceName("Authenticate"))
            
        // Claim Files
        case .getClaimFiles(_):
            return  (.GET, pathForServiceName("GetClaimFiles"))
            
        //Appointments
        case .getAppointments(_):
            return  (.GET, pathForServiceName("GetAppointments"))

        }
        
        
    }
    
    // MARK: - Private
    fileprivate func pathForServiceName(_ serviceName: String) -> String {
        return DataSourceManager.pathForServiceName(serviceName)
    }
    
    fileprivate func replacePathTokens(_ tokenizedPath: String, tokensValues: [String: String]) -> String {
        var toReturn = tokenizedPath
        for (key, val) in tokensValues {
            toReturn = toReturn.replacingOccurrences(of: "{\(key)}", with: val, options: NSString.CompareOptions.literal, range: nil)
        }
        return toReturn
    }
    
    fileprivate var headers: [String: String] {
        var headers: [String: String] = [:]
        
        // add the cached authorization header
//        if let authorizationHeader = self.authenticationController?.authorizationHeader {
//            headers["Authorization"] = authorizationHeader
//        }
        
        return headers
    }
    
    //formatting body
    func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }

}

