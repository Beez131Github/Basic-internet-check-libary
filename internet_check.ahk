#Requires AutoHotkey v2.0

/**
 * internet_check.ahk
 * @author beez131 | beez131_official | https://github.com/Beez131Github | https://github.com/Beez131Github/Basic-internet-check-libary
 *  * true: internet connection found
 *  * false: internet connection not found  
 **/

CheckInternetConnection() {
    urls := ["https://www.google.com", "https://www.microsoft.com", "https://www.amazon.com", "https://www.cloudflare.com"]
    
    for url in urls {
        try {
            whr := ComObject("WinHttp.WinHttpRequest.5.1")
            whr.Open("GET", url, true)
            whr.Send()
            whr.WaitForResponse()
            return true
        } catch {
            continue
        }
    }
    
    return false
}CheckInternetConnection()


CheckInternetStrength() {
    urls := ["https://www.google.com", "https://www.microsoft.com", "https://www.amazon.com", "https://www.cloudflare.com"]
    attempts := 3
    totalTime := 0
    successfulAttempts := 0

    for url in urls {
        Loop attempts {
            startTime := A_TickCount
            try {
                whr := ComObject("WinHttp.WinHttpRequest.5.1")
                whr.Open("GET", url, true)
                whr.Send()
                whr.WaitForResponse()
                endTime := A_TickCount
                totalTime += endTime - startTime
                successfulAttempts++
            } catch {
                continue
            }
        }
    }

    if (successfulAttempts == 0)
        return "No connection"

    avgTime := totalTime / successfulAttempts
    
    if (avgTime < 100)
        return "Excellent"
    else if (avgTime < 300)
        return "Good"
    else if (avgTime < 500)
        return "Fair"
    else
        return "Poor"
}
