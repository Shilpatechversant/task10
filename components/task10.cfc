<cffunction  name="displayFunc" access="remote">
    <cfargument name="key" required="true">
    <cfargument name="value" required="true">
    <cfapplication name="structure" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
     sessionManagement = "Yes">
    <cfif NOT StructKeyExists(Session,"myStruct")>
    <cflock timeout="20" scope="Session" type="Exclusive">
    <cfset Session.myStruct = structNew()>
    </cflock>
    </cfif>
    <cfif StructKeyExists(Session,"myStruct")>
    <cfset alertArray = arrayNew(1)/>
    <cfif IsDefined("arguments.key") AND isDefined("arguments.value")>
    <cfif structKeyExists("#Session.myStruct#",arguments.key)>
    <cfset arrayAppend(alertArray,"#arguments.key# already present,not add again")>
    <cfelse>
    <cfset Session.myStruct["#arguments.key#"] = "#arguments.value#">
    </cfif>
    </cfif>
    </cfif>
    <cfdump var=#Session.myStruct#> 
</cffunction>













