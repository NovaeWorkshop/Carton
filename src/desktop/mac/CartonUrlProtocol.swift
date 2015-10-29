import Foundation

class CartonUrlProtocol : NSURLProtocol {
    
    var connection: NSURLConnection!
    
    override class func canInitWithRequest(request: NSURLRequest) -> Bool {
        NSLog("%@", request.URL!)
        if (request.URL!.scheme == "carton") {
            return true
        }
        return false
    }
    
    override class func canonicalRequestForRequest(request: NSURLRequest) -> NSURLRequest {
        var canonUrl = "carton://" + request.URL!.path!
        if (request.URL!.fragment != nil) {
            canonUrl += "#" + request.URL!.fragment!
        }
        return NSURLRequest(URL: NSURL(string: canonUrl)!)
    }
    
    override func startLoading() {
        var cartonUrl = self.request.URL!.absoluteString
        cartonUrl = cartonUrl.substringFromIndex(cartonUrl.startIndex.advancedBy(9))
        let fileUrl = NSURL(string: "file://" + NSBundle.mainBundle().resourcePath! + "/carton/" + cartonUrl)!
        connection = NSURLConnection(request: NSURLRequest(URL: fileUrl), delegate: self)
    }
    
    override func stopLoading() {
        connection.cancel()
        connection = nil
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        self.client!.URLProtocol(self, didReceiveResponse: response, cacheStoragePolicy: NSURLCacheStoragePolicy.AllowedInMemoryOnly)
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.client!.URLProtocol(self, didLoadData: data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        self.client!.URLProtocolDidFinishLoading(self)
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        self.client!.URLProtocol(self, didFailWithError: error)
    }
}
