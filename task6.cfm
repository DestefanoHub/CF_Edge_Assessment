<!--- 

	Task 6: 
	________

	Write a method to generate random, secure passwords.

 --->
<cfscript>
	/*
	* This function assumes the following
	*	1. The plaintext password is 12 characters long, which is typically sufficient in length, but can be easily expanded.
	*	2. The password is going to be stored somewhere. To securely store it:
	*		A. It needs a salt.
	*		B. It needs to be hashed.
	* It returns all three values.
	*/
	struct function generateRandomPassword(){
		var initPassword = left(generateSecretKey('AES', 128), 12);
		var salt = generateSecretKey('AES', 128);
		var hashedPassword = hash('#initPassword##salt#', 'SHA-512');
		return {
			'Plaintext Password': initPassword,
			'Salt': salt,
			'Hashed Password': hashedPassword
		};
	}

	writeDump(generateRandomPassword());
</cfscript>