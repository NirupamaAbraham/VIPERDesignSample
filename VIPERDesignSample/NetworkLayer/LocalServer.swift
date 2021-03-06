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

// setup the local server
func configureLocalServer() {

    // create the server
    let server = LocalServer()
    
    // setup the server's default namespace
    if let namespace = URL(string: DataSourceManager.baseURL)?.path {
        server.namespace(namespace)
    }
    
    // enable it as the local server in the networking layer
    DataSourceManager.localServerDelegate = server
    
    // Authenticate:
    server.get("/authenticate", handler: { (request, parameters) -> Response in
        return Response(filename: "Authentication", ofType: "json")
    })
    
    
    // Claim Files
    server.get("/claimsadjust_claimFile/claim_files", handler: { (request, parameters) -> Response in
       
            return Response(filename: "Claim", ofType: "json")
    
    })

    //Appointments
    server.get("/claimsadjust_appointment/appointments", handler: { (request, parameters) -> Response in
      
            return Response(filename: "Appointment", ofType: "json")
      
    })
    
}

