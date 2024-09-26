<!--- 

	Task 9: 
	________

	Refactor the following code to the extent you feel is warranted: 

 --->

<cfcomponent name="AliasUtilties" displayname="Alias Utilities" hint="Utilities for Alias lookups and queries">
 
    <!--- Initialize some global vars --->

    <!---CHANGE this scope--->
    <CFSET this.DSN = "">
 
    <!---CHANGE
        If this is a constructor, shouldn't this return an instance of the object?
        Changed returntype attribute and returned 'this'.
    --->
    <CFFUNCTION NAME="Init" ACCESS="Public" HINT="Setup Constructor for Notifications Component" RETURNTYPE="component">
    <!---
    Input: sDSN - DSN
    Output: 0 - Successful
            1 - Error
             
    Objective:
    Sets up the component for use.  Similiar to a constructor in C++.
    --->
     
        <CFARGUMENT NAME="sDSN" DISPLAYNAME="DSN" TYPE="String" REQUIRED="Yes">
         
        <!--- Setup DSN for later use --->
        <!---CHANGE reference the component attribute by 'this' scope for clarity.--->
        <!---CHANGE argument reference to 'arguments' scope for clarity.--->
        <CFSET this.DSN = arguments.sDSN>
                     
        <CFRETURN this>
    </CFFUNCTION>
 
    <CFFUNCTION NAME="GetChildKeys" ACCESS="Public" HINT="Get Children Records" RETURNTYPE="String">
     
        <!--- Get our parameters --->
        <CFARGUMENT NAME="iMasterKey" DISPLAYNAME="3000 Record Inqkey" TYPE="numeric" REQUIRED="Yes">

        <!---CHANGE initialize the query variable.--->
        <cfset var AliasInqkeyLookup = queryNew("")>
         
        <!--- Get the hit records --->
        <!---CHANGE reference the component attribute DSN by 'this' scope for clarity.--->
        <!---CHANGE argument reference to 'arguments' scope for clarity.---> 
        <cfquery name="AliasInqkeyLookup" datasource="#this.DSN#">
            SELECT ChildKey
            FROM AliasCrosstable
            WHERE MasterKey = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.iMasterKey#">
        </cfquery>
         
        <!---CHANGE return the valuelist result directly instead of making a variable.---> 
        <cfreturn ValueList(AliasInqkeyLookup.ChildKey)>         
    </CFFUNCTION>
 
    <!---CHANGE
        The output of this function is later used as an integer, since I can't see the table, I am assuming that this should be a numeric value.
        Changed the return type to numeric.
    --->
    <CFFUNCTION NAME="GetMasterKey" ACCESS="Public" HINT="Get Master Records" RETURNTYPE="numeric">
     
        <!--- Get our parameters --->
        <CFARGUMENT NAME="iChildKey" DISPLAYNAME="3000 Record Child Inqkey" TYPE="numeric" REQUIRED="Yes">

        <!---CHANGE
            This doesn't need to be a param, it could just as easily be a regular variable initialized to 0.
            Changed it to be a number instead of a string.
        ---> 
        <CFset var sMasterKey = 0>

        <!---CHANGE initialize the query variable.--->
        <cfset var GetMasterKey = queryNew("")>
         
        <!--- Get the hit records --->
        <!---CHANGE reference the component attribute DSN by 'this' scope for clarity.--->
        <!---CHANGE argument reference to 'arguments' scope for clarity.--->
        <cfquery name="GetMasterKey" datasource="#this.DSN#">
            SELECT MasterKey
            FROM AliasCrosstable
            WHERE ChildKey = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.iChildKey#">
        </cfquery>
         
        <cfif GetMasterKey.RecordCount GT 0>
            <cfset sMasterkey = GetMasterkey.Masterkey>
        </cfif>
         
        <CFRETURN sMasterKey>
    </CFFUNCTION>
 
    <cffunction name="GetNamesFromMaster" access="public" returntype="array">
     
        <!--- Get our parameters --->
        <cfargument name="iChildKey" type="numeric" default="-1">
         
        <!--- Create RETURN STRUCT --->
        <!---CHANGE var this and don't use the arraynew() function--->
        <cfset var returnValue = []>
 
        <!--- Find Master Record, if there is one --->
        <!---CHANGE var this--->
        <!---CHANGE argument reference to 'arguments' scope for clarity.--->
        <cfset var MasterKey = GetMasterKey(arguments.iChildKey)>

        <!---CHANGE initialize the query variable.--->
        <cfset var GetAliasList = queryNew("")>
         
        <cfif MasterKey GT 0>
         
            <!--- We have the 3000 record, now lets pull out Memo1 and see if there are aliases --->
            <!---CHANGE the dsn should be from this class, not the session.--->
            <cfquery name="GetAliasList" datasource="#this.dsn#">
                SELECT Memo1
                FROM Wip
                WHERE Inqkey = <cfqueryparam cfsqltype="cf_sql_numeric" value="#MasterKey#">
            </cfquery>
             
            <!--- If we have a record and we have a Memo1 value, parse it --->
            <cfif GetAliasList.RecordCount EQ 1 AND Len(GetAliasList.Memo1) GT 0>
                <!--- Name List exists as "Last1,First1,Middle1|Last2,First2,Middle2..." or "Last1,First1|Last2,First2..." --->
                <!---CHANGE var this--->
                <cfset var NameArray = ListToArray(GetAliasList.Memo1, "|")>

                <!---CHANGE used a for loop instead--->
                <cfloop index="i" from="1" to="#NameArray.len()#">
                    <!---CHANGE var this and don't use the structNew() function.--->
                    <cfset var nRec = {}>

                    <cfif ListLen(NameArray[i]) EQ 3>
                        <cfset nRec.LastName = ListGetAt(NameArray[i], 1)>
                        <cfset nRec.FirstName = ListGetAt(NameArray[i], 2)>
                        <cfset nRec.MiddleName = ListGetAt(NameArray[i], 3)>
                    <cfelse>
                        <cfset nRec.LastName = ListGetAt(NameArray[i], 1)>
                        <cfset nRec.FirstName = ListGetAt(NameArray[i], 2)>
                        <cfset nRec.MiddleName = "">
                    </cfif>

                    <cfset ArrayAppend(returnValue, nRec)>
                </cfloop>
            </cfif>
        </cfif>
         
        <cfreturn returnValue>
    </cffunction>
</CFCOMPONENT>