//
//  NQHTTPRequest.swift
//  Pods
//
//  Created by MAC MINI  on 11/26/15.
//
//

import UIKit
import Foundation
import AFNetworking

public class NQHTTPRequest: NSObject {
    
    var httpRequest:AFHTTPRequestOperationManager!
    var BASE_URL:String = ""
    
    public static let sharedInstance = NQHTTPRequest()
    
    override init() {
        super.init()
        self.httpRequest = AFHTTPRequestOperationManager()
    }
    
    // MARK:
    // MARK: Create url
    public func URLRequestWithPath(pathRequest:String) ->String{
        
        var baseURL = BASE_URL
        
        if (baseURL.characters.last == "/" ) {
            baseURL = BASE_URL.substringToIndex(BASE_URL.endIndex)
        }
        
        var path = pathRequest
        if pathRequest.characters.first == "/" {
            path = pathRequest.substringFromIndex(pathRequest.startIndex)
        }
        
        return baseURL + "/" + path
    }
    
    public func URLRequestWithPath(pathRequest:String, baseURL:String) ->String{
        
        var baseURLRequest = baseURL
        
        if (baseURLRequest.characters.last == "/" ) {
            baseURLRequest = baseURL.substringToIndex(baseURL.endIndex)
        }
        
        var path = pathRequest
        if pathRequest.characters.first == "/" {
            path = pathRequest.substringFromIndex(pathRequest.startIndex)
        }
        
        return baseURLRequest + "/" + path
    }
    
    // MARK:
    // MARK: Add header and Response Accept ContentType
    public func addHeader(header:[String:String]?){
        
        if header == nil{
            return
        }
        
        for key:String in header!.keys{
            httpRequest.requestSerializer.setValue(header![key], forHTTPHeaderField: key)
        }
    }
    
    public func addAcceptContentType(contentTypeValue:String){
        let contentType:Set<NSObject> = httpRequest.responseSerializer.acceptableContentTypes!
        let contenTypeSet = NSMutableSet(set: contentType)
        
        contenTypeSet.addObject(contentTypeValue)
        
        httpRequest.responseSerializer.acceptableContentTypes = contenTypeSet as Set<NSObject>
    }
    
    //MARK:
    //MARK: http request
    // GET Request
    public func GETRequest(urlRequest: String, headerRequest: [String:String]?, urlParam: [String:String], success: (responseObject:AnyObject)->(), fail: (error:NSError)->()){
        
        addHeader(headerRequest)
        httpRequest.GET(urlRequest, parameters: urlParam, success: { (operation:AFHTTPRequestOperation, responseObject:AnyObject) ->
            Void in
            success (responseObject: responseObject)
            
            }) { (operation:AFHTTPRequestOperation?, error:NSError) -> Void in
                fail(error: error)
        }
        
    }
    // POST Request
    public func POSTRequest(urlRequest: String, headerRequest: [String:String]?, urlParam: [String:String], success: (responseObject:AnyObject)->(), fail: (error:NSError)->()){
        
        addHeader(headerRequest)
        httpRequest.POST(urlRequest, parameters: urlParam, success: { (operations:AFHTTPRequestOperation, responseObject:AnyObject) -> Void in
            success (responseObject: responseObject)
            
            }) { (operation:AFHTTPRequestOperation?, error:NSError) -> Void in
                fail(error: error)
        }
        
    }
    
    // PUT Request
    public func PUTRequest(urlRequest: String, headerRequest: [String:String]?, urlParam: [String:String], success: (responseObject:AnyObject)->(), fail: (error:NSError)->()){
        
        addHeader(headerRequest)
        httpRequest.PUT(urlRequest, parameters: urlParam, success: { (operation:AFHTTPRequestOperation, responseObject:AnyObject) -> Void in
            success(responseObject: responseObject)
            }) { (operation:AFHTTPRequestOperation?, error:NSError) -> Void in
                fail(error: error)
        }
        
    }
    
    // DELETE Request
    public func DELETERequest(urlRequest: String, headerRequest: [String:String]?, urlParam: [String:String], success: (responseObject:AnyObject)->(), fail: (error:NSError)->()){
        
        addHeader(headerRequest)
        httpRequest.DELETE(urlRequest, parameters: urlParam, success: { (operation:AFHTTPRequestOperation, responseObject:AnyObject) -> Void in
            success(responseObject: responseObject)
            }) { (operation:AFHTTPRequestOperation?, error:NSError) -> Void in
                fail(error: error)
        }
        
    }

    
    
}
