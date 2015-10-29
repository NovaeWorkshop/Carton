import WebKit

class CartonPolicyDelegate : NSObject, WebPolicyDelegate {

    /*
    func webView(webView: WebView!,
        decidePolicyForNavigationAction actionInformation: [NSObject : AnyObject]!,
        request: NSURLRequest!,
        frame: WebFrame!,
        decisionListener listener: WebPolicyDecisionListener!)
    {
        NSLog("%@", actionInformation)
        NSLog("Callback test")
        NSLog("%@", request)
        /*let url = request.URL!.absoluteString
        if (url.hasPrefix("carton://")) {
            var path = url
            path.removeRange(path.startIndex..<path.startIndex.advancedBy(9))
            let baseUrl = "file://" + NSBundle.mainBundle().resourcePath! + "/carton/" + path
            let fullUrl = NSURL(string: path, relativeToURL: (NSURL(string: baseUrl)))
            frame.loadRequest(NSURLRequest(URL: fullUrl!))
            listener.
            
        } else {
            listener.use()
        }*/
        listener.use()
    }
*/
}
