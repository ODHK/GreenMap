WHAT: 
-----
Greenmap aims to make it more convenient to be environmently friendly by showing you on a map where you can. 

1. get rid of things such as recycleables (plastic, metal, paper), food and clothing.

2. Get things, such as second hand stores, freecycling warehouses, or organic retail stores. 

3. events such as meetups for giving/swapping or regular markets for second hand items. 

Also, we give a ecoScore for your current location based on the distances to a set of the above places. 

This prototype is for IOS, but because it is built using HTML5/Phonegap, it can easily be migrated to Android or other mobile platforms. 

WHY:
-----
For the user, it's difficult to find out where these resources. 

As communities become more eco minded, it will help planners to figure out what's missing in a particular location, so they can go about rectifying it.


WHO:
-----
Eco-concsious people in Hong Kong

STATUS:
--------
The backend will serve data as KML. Currently it is serving this data hosted off my evernote account. This data was created manually by the original greenmap.hk group at Make 01 (HK's first OpenData hackathon) over the course of 2 days. 

We envision our data coming from 2 sources

1. OpenData. Ideally this would be scraped, but for the event it was manually scraped. The exactly data sources TBA.
 
2. Crowdsourced. For data points that no OpenData exists (i.e. a recycle bin at a private housing estate), the app (in the future) will enable a user to add it into the database. 

The backend that operates on the above 2 data sources does not yet exist. The hacked together backend is a spreadsheet with data manually entered in. There is a script, csv2kml, that converts the CSV version of the spreadsheet into KML. this hosted somewhere for the mobile application to consume. 

LICENCES:

This app was built using Phonegap and KendoUI. Their licenses are below:

PhoneGap: 
http://phonegap.com/about/license/

KendoUI:
https://www.kendoui.com/purchase/license-agreement/kendo-ui-web-commercial.aspx

