#Requires AutoHotkey v2.0

/**
 * internet_check.ahk
 * @author beez131 | beez131_official | https://github.com/Beez131Github
 *  * true: internet connection found
 *  * false: internet connection not found  
 **/

CheckInternetConnection() {
    try {
        whr := ComObject("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", "https://www.google.com", true)
        whr.Send()
        whr.WaitForResponse()
        return true
    } catch {
        return false
    }
}