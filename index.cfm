<html>
    <head>
        <link rel="stylesheet" href = "css/style.css">
        <title>Task 10</title>
    </head>
    <body style="background-color:#c1ddb4;">
        <section>
            <div class="main_container">
                <div class = "forms card">
                    <h3>Structure Function- Sort key</h3>
                    <hr>                    
               <cfform name="cftask_5" action="">
                      <div class="form-group">
                                          
                        <label> Name</label>
                            <input type="text" name="first_name" 
                            required autocomplete="off">
                        </div>
                      
                        <div class="form-group">
                                         
                        <label> Value</label>
                    <input type="text" name="depart"  required  autocomplete="off">
                        </div>
                    
                
                        <div class="form-btn-control">
                            <input type="submit" class="common-btn" name="submit" onClick="#showAlert#"
                            value="Submit"/>
                        </div>
                    </cfform>
                </div>
            </div>
        </section>
    </body>
</html>

 <cfif structKeyExists(form,'Submit')>
<cfset titles = StructNew()> 
<cfset a = StructInsert(titles, "#form.first_name#", "#form.depart#", 1)>  

<cfset myArray = arrayNew(1)>
  <cfset arrayAppend(myArray, titles)>
  
  <cfset key=form.first_name>
  <cfset value=form.depart>
 <cfapplication name="structures" sessionTimeout = #CreateTimeSpan(0, 0, 0, 60)#
                        sessionManagement = "Yes">    
<cfif NOT StructKeyExists(Session, "mystruct")>
    <cflock timeout=20 scope="Session" type="Exclusive">
      <cfset Session.mystruct = structNew()>
    </cflock>
</cfif>

<cfif StructKeyExists(Session, "mystruct")>
  <cfif IsDefined("key") AND  IsDefined("value") >
   <cfif  StructKeyExists(Session.mystruct,"#key#")>
        <p>Key Already exist</p>
                  
        </cfif>

    <cfif NOT StructKeyExists(Session.mystruct,"#key#")>
      <cfset Session.mystruct["#key#"] = #value#> 

      <cfset myArray = structKeyArray(Session.mystruct)>
      <cfset fArray = myArray.sort("text","asc")>    
    </cfif>    
  </cfif>
</cfif>
<div class="resbox">

<cfdump var="#Session.mystruct#">	
 <cfdump var = #fArray#>
</div>
</cfif>

