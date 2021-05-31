//: Playground - noun: a place where people can play

//... Example 1.0 Your first switch case
///* ...
import Cocoa

var statusCode: Int = 403
var errorString: String

switch statusCode {
case 400:
    errorString = "Bad request"
    
case 401:
    errorString = "Unauthorized"

case 403:
    errorString = "Forbidden"

case 404:
    errorString = "Not found"
    
default:
    errorString = "None"
} // end switch..case
//... */

//... Example 2.0 Switch cases can have multiple values in the case

var statCode: Int = 400
var errorMessage: String = "The request failed with the error:"
switch statusCode {
    
case 400, 401, 403, 404:
    errorMessage = "There was something wrong with the request."
    fallthrough
default:
    errorMessage += " Please review the request and try again."
}


//... Example 3.0 Switch cases can have single values, multiple values, or ranges of values


var statusID: Int = 403
var errorStr:String = "Message: "
switch statusID {
case 100, 101:
    errorStr += " Informational, 1xx."
    
case 204:
    errorStr += " Successful but no content, 204."
    
case 300...307:
    errorStr += " Redirection, 3xx."
    
case 400...417:
    errorStr += " Client error, 4xx."
    
case 500...505:
    errorStr += " Server error, 5xx."
    
default:
    errorStr = "Unknown. Please review the request and try again."
}


//... Example 4.0  Using value binding

var sCode: Int = 506
var errorMsg:String = "Message: "

switch sCode {
case 100, 101:
    errorMsg += " Informational, \(sCode)."
    
case 204:
    errorMsg += " Successful but no content, 204."
    
case 300...307:
    errorMsg += " Redirection, \(sCode)."
    
case 400...417:
    errorMsg += " Client error, \(sCode)."
    
case 500...505:
    errorMsg += " Server error, \(sCode)."
    
case let unknownCode:
    errorMsg = "\(unknownCode) is not a known error code."
    
}


//... Example 5.0 Using where clause to create a filter

var statusCodeID: Int = 95
var errString: String = "The request failed with the error:"
switch statusCodeID {
case 100, 101:
    errString += " Informational, \(statusCode)."
    
case 204:
    errString += " Successful but no content, 204."
    
case 300...307:
    errString += " Redirection, \(statusCode)."
    
case 400...417:
    errString += " Client error, \(statusCode)."
    
case 500...505:
    errString += " Server error, \(statusCode)."
    
case let unknownCode where (unknownCode >= 205 && unknownCode < 300) || unknownCode > 505:
    
    errString = "\(unknownCode) is not a known error code."
    
default:
    errString = "Unexpected error encountered."
}


//... Example 6.0 Switch cases can have multiple values in the case

var errorStatusCode: Int = 403
var errorOutputMessage: String = "The request failed with the error:"
switch errorStatusCode {
    
case 400, 401: // if the value in this case is matched, then it will fall through next case and display the output of that case also
    errorOutputMessage = "There was something wrong with the request."
fallthrough
case 403:
    errorOutputMessage = "There was something wrong with the request."
    
case 404: // if the value in this case is matched, then it will fall through next case and display the output of that case also
    errorOutputMessage = "There was something wrong with the request."
    fallthrough
case 505:
    errorOutputMessage = "There was something wrong with the request."
    
default:
    errorOutputMessage += " Please review the request and try again."
}
