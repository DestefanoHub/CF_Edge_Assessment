component displayname="Developer Code Challenges" {

	this.name = hash(cgi.server_name,"MD5");
	
	/* this.datasources["DeveloperTests"] = {
		  class: 'com.microsoft.sqlserver.jdbc.SQLServerDriver'
		, bundleName: 'mssqljdbc4'
		, bundleVersion: '4.0.2206.100'
		, connectionString: 'jdbc:sqlserver://localhost:1433;DATABASENAME=DeveloperTests;sendStringParametersAsUnicode=true;SelectMethod=direct'
		, username: 'cfdeveloper'
		, password: "encrypted:9e2346484825c87202ee92be660f900f8f3e038fd44901a693013989e53052a7"		
		// optional settings
		, blob:true // default: false
		, clob:true // default: false
		, connectionLimit:100 // default:-1
		, connectionTimeout:10 // default: 1; unit: minutes
		, validate:false // default: false
	}; */
}