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

$Id$

Notes:
--->
<cfcomponent
	displayname="Chapter"
	output="false">

	<!---
	PROPERTIES
	--->
	<cfset variables.id = 0 />
	<cfset variables.name = "" />
	<cfset variables.location = "" />
	<cfset variables.statusCode = "" />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="enlist.model.chapter.Chapter" output="false">
		<cfargument name="id" type="numeric" required="false" default="0" />
		<cfargument name="name" type="string" required="false" default="" />
		<cfargument name="location" type="string" required="false" default="" />
		<cfargument name="statusCode" type="string" required="false" default="" />

		<cfset setInstanceMemento(arguments) />

		<cfreturn this />
	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="getDisplayName" access="public" returntype="string" output="false">
		<cfreturn getName() & " (" & getLocation() & ")" />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="struct" output="false">
		<cfscript>
			var errors = StructNew();

			if (Len(Trim(getName())) eq 0) {
				errors.name = "You must enter a name for the chapter";
			}

			if (Len(Trim(getLocation())) eq 0) {
				errors.location = "You must enter a location for the chapter";
			}

			if (Len(Trim(getStatusCode())) eq 0) {
				errors.statusCode = "You must enter a status for the chapter";
			}

			return errors;
		</cfscript>
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="void" output="false">
		<cfargument name="data" type="struct" required="true" />
		
		<cfset setId(arguments.data.id) />
		<cfset setName(arguments.data.name) />
		<cfset setLocation(arguments.data.location) />
		<cfset setStatusCode(arguments.data.statusCode) />
 	</cffunction>
	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false">
		
		<cfset var data = structnew() />
		<cfset var fieldname = "" />

		<cfloop list="id,name,location,statusCode" index="fieldname">
			<cfset data[fieldname] = variables[fieldname]>
		</cfloop>

		<cfreturn data />
	</cffunction>

	<!---
	ACCESSORS
	--->
 	<cffunction name="getId" access="public" returntype="numeric" output="false">
		<cfreturn variables.id />
	</cffunction>
	<cffunction name="setId" access="public" returntype="void" output="false">
		<cfargument name="id" type="numeric" required="true" />
		<cfset variables.id = arguments.id />
	</cffunction>

	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.name />
	</cffunction>
	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfset variables.name = Trim(arguments.name) />
	</cffunction>

	<cffunction name="getlocation" access="public" returntype="string" output="false">
		<cfreturn variables.location />
	</cffunction>
	<cffunction name="setlocation" access="public" returntype="void" output="false">
		<cfargument name="location" type="string" required="true" />
		<cfset variables.location = Trim(arguments.location) />
	</cffunction>

	<cffunction name="getstatuscode" access="public" returntype="string" output="false">
		<cfreturn variables.statuscode />
	</cffunction>
	<cffunction name="setstatuscode" access="public" returntype="void" output="false">
		<cfargument name="statuscode" type="string" required="true" />
		<cfset variables.statuscode =Trim( arguments.statuscode ) />
	</cffunction>

</cfcomponent>