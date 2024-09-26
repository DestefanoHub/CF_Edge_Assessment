<!--- 

	Task 14: 
	________

	Write code to get and display the Image of the Day from www.bing.com 

 --->
<cfscript>
	bingRequest = new http();
	bingRequest.setMethod('get');
	bingRequest.setUrl('https://www.bing.com');
	bingResponse = bingRequest.send().getPrefix();

	if(bingResponse.responseheader.status_code == 200){
		startPosition = findNoCase('<meta property="og:image" content="', bingResponse.filecontent);
		startPosition = startPosition + len('<meta property="og:image" content="');
		endPosition = findNoCase('"', bingResponse.filecontent, startPosition);
		imageURL = mid(bingResponse.filecontent, startPosition, endPosition - startPosition);
		writeOutput('<img src="#encodeForHTMLAttribute(imageURL)#"/>');
	}else{
		writeOutput('<h3>Unable to get image from bing.com</h3>');
	}
</cfscript>