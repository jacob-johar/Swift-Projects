//
//  DataModelManager.swift
//  TicketApp
//
//  Created by jacob n johar on 17/11/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import Foundation
class JSONManager{
    func fetchJSONData(completionHandler : @escaping ([Value]) -> Void) {


          let url = URL(string: "https://raw.githubusercontent.com/jacob-johar/Map523data/main/course_data.json")!
                 
                 // Create (define) a task; remember that we are just defining it
                 // After the multi-line statement executes, "task" exists,
                 // but it is in a "suspended" state
                 
                 // The task requires a callback parameter, which is a Swift closure
                 // When the task completes, it will call the closure (function),
                 // and pass some arguments; all three are optional; see the docs...
                 // https://developer.apple.com/documentation/foundation/urlsession/1410330-datatask
                 
    
      
                 let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                     
                     // Do two checks BEFORE attempting to extract the data from the response
                     // 1. Check whether an "error" object was passed in
                     // 2. Check that the HTTP response status is what we expect
                     
                     // If there is an error, then "error" will have something in it
                     // Otherwise, it will be nil
                     if let error = error {
                         print(error)
                         return
                     }
                     
                     // We want to ensure that we have a good HTTP response status
                     guard let httpResponse = response as? HTTPURLResponse,
                         (200...299).contains(httpResponse.statusCode)
                         else {
                             // Show the URL and response status code in the debug console
                             if let httpResponse = response as? HTTPURLResponse {
                                 print("URL: \(httpResponse.url!.path )\nStatus code: \(httpResponse.statusCode)")
                             }
                             return
                     }
                     
                     // If we're here, we can get started on
                     // extracting the data from the response
                     
                     // Ensure that three conditions are met (multiple if-let)...
                     // 1. Non-nil Content-Type header
                     // 2. Content-Type starts with "text/plain"
                     // 3. Data is non-nil
                     if let mimeType = httpResponse.mimeType,
                         mimeType.starts(with: "text/plain"),
                         let data = data {
                         
                         // Create and configure a JSON decoder
                         let decoder = JSONDecoder()
                         decoder.dateDecodingStrategy = .iso8601
                         
                         // Attempt to decode the data into a "CoursePackage" object
                         do {
                          
                             let result = try decoder.decode(Tickets.self, from: data)
                            completionHandler(result.data)
                            
                            
                           
                             
                         }
                         catch {
                             print(error)
                         }
                     }
                 }
                 
                 // Now that "task" has been fully defined, execute it...
                 task.resume()
            
      }

}
