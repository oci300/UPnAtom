//
//  UPnPManager.swift
//
//  Copyright (c) 2015 David Robles
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import upnpx

private let _UPnPManagerSharedInstance = UPnPManager_Swift()

@objc public class UPnPManager_Swift {
    // public
    public class var sharedInstance: UPnPManager_Swift {
        return _UPnPManagerSharedInstance
    }
    public let upnpRegistry: UPnPRegistry
    
    // internal
    let ssdpDB = SSDPDB_ObjC()
    let eventSubscriptionManager: UPnPEventSubscriptionManager
    
    init() {        
        upnpRegistry = UPnPRegistry(ssdpDB: ssdpDB)
        eventSubscriptionManager = UPnPEventSubscriptionManager()
        
        ssdpDB.startSSDP()
    }
    
    deinit {
        ssdpDB.stopSSDP()
    }
    
    public func searchForAll() {
        ssdpDB.searchSSDP()
    }
    
    public func searchForMediaServer() {
        ssdpDB.searchForMediaServer()
    }
    
    public func searchForMediaRenderer() {
        ssdpDB.searchForMediaRenderer()
    }
    
    public func searchForContentDirectory() {
        ssdpDB.searchForContentDirectory()
    }
}
