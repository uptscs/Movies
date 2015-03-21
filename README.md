#Movies - RottenTomattoes

ABSTRACT:
This is sample application which has following major demonstration: 1)Integration of RottenTomattoes APIs 2) Using AFNetworking for network communication 3) Making Image caching enabled using SDWebImage caching API 4) Pagination in  "search movie" list using BottomPullToRefresh API.
What to look for in this Project
• Efficient implementation of Movie search
• AFNetworing Integration with callbacks when response received.
Movie search is implemented in ViewController and also responsible to make Movie Search API call. 
WwebserviceOperation is handling network communication and receiving data, the passing the respective parser method to parse.
Parsing of Json (received from API) and converting it into the model object is implemented in MovieParser
All the generic application constants are declared in Constant file
Movie is the model having all the required attributes.
BUILD REQUIREMENTS:
iOS 8.0 SDK or later

RUNTIME REQUIREMENTS:
iOS 7.0 or later

INSTALLATION INSTRUCTION:
Download the application from Git and run in the Xcode version 6.1 or later.

PACKAGING LIST:
AppDelegate: There are couple of CoreData handlers are implemented, for the future upgradation to CoreData storage of movie lists.
ViewController: Searching Movie and presenting it to user in list format
WebserviceOperation: This class inherited from AFNetworking and does the webservice/network handling and notify the caller with the result.
Movie: Model class for movie
SearchHistoryViewController: Reading the list of searched terms from saved plist, and present it to user in list format.
MovieDetailViewController: Shows the movie details with detailed informations.
ThirdPartyLibrary used: Reachability, AFNetworking, MNMBottomPullToRefresh, SDWebImage
Contacts
If you want inform about bug fixes, security fixes please raise the ticket in Git repository or shoot the mail uptscs@gmail.com

Copyright (C) 2015-2016 Upendra All rights reserved.
