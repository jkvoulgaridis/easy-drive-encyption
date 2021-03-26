# easy-drive-encyption

A toy script for encrypting/decrypting a whole drive (recurcively). 

To install type : `git clone <urltorepo>` and substitute <urltorepo> with the url to this repo. 

A use example: `./endndr <drive_name> [c|d]` where : 
		* <drive_name> is the target driver mounted
		* c, d are mutually exclusive arguents for encryption/decryption respectively. 
		
		
encryption/ decription ops use openssl suite. 


#NEXT STEPS:

Current version supports 1 level of hierarchy. My goal is to make this app usefull for real-lide
hierchical drives (containing files, folders, folders of folders and so on and so for)

