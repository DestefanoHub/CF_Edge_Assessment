<!--- 

	Task 10: 
	________

	Debug and correct the following method. When this template is run, all patterns should return a threat level of 10.  You may run the template initially to see what the current results are; make any corrections necessary to ensure all patterns tested return a value of 10.

 --->

<cfset patterns = [
    "--",
    "or 1=1--",
    "1 OR 1=1",
    "or 1 in (@@version)--",
    "1 or 1 in (@@version)--",
    "@@version",
    "; waitfor delay '0:30:0'--",
    "1; waitfor delay '0:30:0'--",
    "||Utl_Http.request('http://<yourservername>') from dual--",
    "1||Utl_Http.request('http://<yourservername>') from dual--",
    "xsstest",
    "xsstest%00""<>'",
    "</foo>",
    "<foo></foo>",
    "))))))))))",
    "../../../../../../../../../../etc/passwd",
    "../../../../../../../../../../boot.ini",
    "..\..\..\..\..\..\..\..\..\..\etc\passwd",
    "..\..\..\..\..\..\..\..\..\..\boot.ini",
    "../../../../../../../../../../windows/win.ini",
    "..\..\..\..\..\..\..\..\..\..\windows\win.ini",
    "|| ping -i 30 127.0.0.1 ; x || ping -n 30 127.0.0.1 &",
    "| ping -i 30 127.0.0.1 |",
    "| ping -n 30 127.0.0.1 |",
    "& ping -i 30 127.0.0.1 &",
    "& ping -n 30 127.0.0.1 &",
    "; PING 127.0.0.1 ;",
    "PING 127.0.0.1",
    "%0a ping -i 30 127.0.0.1 %0a",
    "`ping 127.0.0.1`",
    "| id",
    "& id",
    "; id",
    "%0A id %0A",
    "`id`",
    ";echo 111111",
    "echo 111111",
    "response.write 111111",
    ":response.write 111111",
    "http://<yourservername>/",
    "<youremail>%0aCc:<youremail>",
    "<youremail>%0d%0aCc:<youremail>",
    "<youremail>%0aBcc:<youremail>",
    "<youremail>%0d%0aBcc:<youremail>",
    "%0aDATA%0afoo%0a%2e%0aMAIL+FROM:+<youremail>%0aRCPT+TO:+<youremail>%0aDATA%0aFrom:+<youremail>%0aTo:+<youremail>%0aSubject:+tst%0afoo%0a%2e%0a"
]>
 
<cffunction name="extendedValidation" access="public" output="false" returntype="numeric" hint="adds additional, explicit threat testing beyond the base tests">
    <cfargument name="scope" type="string">
    <cfargument name="varName">
    <cfargument name="value">
 
    <!--- explicit testing of url parameter values --->
    <cfif arguments.scope eq "url">
        <!---CHANGE
            Fixed spelling of @@vrsion
            Function changed to case insensitive
        --->
        <cfif reFindNoCase("(delay|@@version|ping|foo|xss|echo|or)", arguments.varName)><!--- treat it like its the name of a querystring param --->
            <cfreturn 10>
        </cfif>
 
        <!---CHANGE
            Fixed spelling of @@vrsion
            Function changed to case insensitive
        --->
        <cfif reFindNoCase("(delay|@@version|ping|foo|xss|echo|response\.write|or)", arguments.value)><!--- treat it like its the value of a querystring param --->
            <cfreturn 10>
        </cfif>
 
        <cfif refind("[0-9]*(\||&|;|\(|\))",arguments.value)>
            <cfreturn 10>
        </cfif>
 
        <cfif refind("(<|>|\|\|)",arguments.value)>
            <cfreturn 10>
        </cfif>

        <!---CHANGE
            Escaped the /
            Removed one -
            Added |`
        --->
        <cfif refind("(\.\/|\.\\|--|`)",arguments.value)>
            <cfreturn 10>
        </cfif>
 
        <!---CHANGE
            Functions changed to case insensitive
        --->
        <cfif findNoCase("%0a",arguments.value) or findNoCase("%0a",urldecode(arguments.value))>
            <cfreturn 10>
        </cfif>
    </cfif>
 
    <cfreturn 0>
</cffunction>
 
<!--- all values tested should return a threat level of 10 --->
<cfoutput>
<pre>
<cfloop array="#patterns#" index="p">
[#extendedValidation(scope="url",varname=p,value=p)#]#chr(9)##encodeforhtml(p)#
</cfloop>
</pre>
</cfoutput>