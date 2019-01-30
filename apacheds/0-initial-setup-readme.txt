1. Install software
	a) ApacheDS https://directory.apache.org/apacheds/downloads.html
	b) Install Apache Directory Studio https://directory.apache.org/studio/downloads.html

2. Change the default ports
	a) Launch Apache Directory Studio
	b) Open the server configuration and change the default ports from 10389 and 10636 to 389 and 636
	c) Save the configuration and restart the ApacheDS service
	d) Reconfigure Apache Directory Studio to connect on the new port(s)

3. Configure the partitions
	a) Open the server configuration
	b) Delete the example partition
	c) Add a new nhs partition with the following attributes:
		
		Partition type: JDBM
		ID: nhs
		Suffix: o=nhs

		Attributes:
			objectClass: top
			objectClass: organization
			o: nhs

	c) Save the configuration and restart the ApacheDS service

4. Protect the config, schema and system partitions, and make the nhs partition read only for non-authenticated users

	a) Open the server configuration and select enable access control
	b) Restart the ApacheDS service
	c) Reconnect using Apache Directory Studio using Simple Authentication with username 'uid=admin,ou=system' and password 'secret'
	d) All entries in the directory are now not readable (apart from the root partition elements) for anonymous users

	The next steps re-enable read only access to the nhs partition:

	(taken from https://directory.apache.org/apacheds/advanced-ug/4.2.7.1-enable-authenticated-users-to-browse-and-read-entries.html)

	e) Enable 'Fetch Operational Attributes' on the o=nhs partition from the context menu in Apache Directory Studio
	f) Add a new attribute to the o=nhs element called 'administrativeRole' with a value of 'accessControlSpecificArea'.
	g) Add a new entry to the o=nhs element with the 'accessControlSubentry', 'subentry' and 'top' classes.
		 Next screen - set the RDN to be 'cn=enableSearchForAllUsers'
		 ACI Item Editor - set the Identification Tag to be 'enableSearchForAllUsers', select 'User First', tick 'All Users', and open the 'Add User Permissions' dialog
		 Add User Permissions - tick 'Entry', 'All User Attribute Types and Values', 'Browse', 'Read' and 'ReturnDN'
		 Close both dialogs and so the 'New Entry' dialog is showing, open the subtree specification then close it in order to populate it with the default {}.
		 Click OK to save the permissions.

	The nhs partition is now available as read only to anonymous users.

5. Restart the ApacheDS service.


