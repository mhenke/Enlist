<!---

    Enlist - Volunteer Management Software
    Copyright (C) 2011 GreatBizTools, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.

$Id: $

Notes:
--->
<cfcomponent
	displayname="UserService"
	output="false">
	
	<!---
	PROPERTIES
	--->
	<cfset variables.googleUserService = "" />
	<cfset variables.userGateway = "" />
	
	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="UserService" output="false"
		hint="Initializes the service.">

		<cfset var googleUserFactory = CreateObject("java", "com.google.appengine.api.users.UserServiceFactory") />
		
		<cfset variables.googleUserService = googleUserFactory.getUserService() />
			
		<cfreturn this />
	</cffunction>
	
	<cffunction name="setUserGateway" access="public" returntype="UserService" output="false">
		<cfargument name="userGateway" type="any" required="true" />
		<cfset variables.userGateway = arguments.userGateway />
	</cffunction>
	
	<cffunction name="getGoogleUserService" access="public" returntype="any" output="false">
		<cfreturn variables.googleUserService />
	</cffunction>
	
	<!---
	PUBLIC FUNCTIONS
	--->
	
</cfcomponent>