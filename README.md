# AD_GroupAutomation
A Script that utilities PowerShell in a way to automate the process of adding active directory groups to user profiles.

# Requirements to use 
To use this script in a business enviroment there are things that the user will need to have. 
 1. The user will need access to Active Directory on the network.
 2. The user will need to have Admin change rights on the network and the Active directory system.
 3. The user will need to know the credentials of thier logon to use the program.
 4. The user WILL need correct permissions and access provided by a system Owner/Admin to utilise this service <br>
 **I take no resposibility in this program being used maliciously or incorrectly and cannot be held accountable.**
 5. This will require use of powershell with and admin account.

# Restirctions
Thought the code provided you will see things such as "Group1" and "Domain 1". This was intentionally done to maintain security and not breach any confidnetial agreements made with the company the software was developed for. The sensative information in this code will be chanegd to something different so that both compettiors and and rivals may not gain insight or an advantage on the business this code was made for.

This code has been used and tested inside a business enviroment and is something used effectivly; This code allows the user to run the code while continuing with other work. Reducing the time spend on small tedious taks by automating this process allows employees to allocate time elsewhere.

# How To Use
This script depending on its use can be either quicker or slower than the standard process of adding the AD gorup to the users profile.
The process the company i designed the script for leaves an aduit trail requiring emails to be sent and everything to be approved before being provisioned. This process means that each user needs to have a request raised for them. This makes the process of gathering all User ID's long, this is something that would take alot of time to collate each user so this is something only used for bulk adding (10+ Users).
Doing this and abiding by the audit rules i keep a docuemnt to track each user added by the script with a request number in an excel sheet. **This is highly reccomeneded incase an error is made or if there is a dispute on access.** 
