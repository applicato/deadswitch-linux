# Dead Switch Version 2.0.0

# Summary of changes

- removed the need for password file 'ouput.txt' in which I hide the users Dead Switch password in
- replaced how the check-in password is stored with a more simple method which just encrypts the password and stores that in the Dead Switch folder
- added a check to see if the computer is online so that Dead Switch can send the email if necessary otherwise it keeps checking for a connection before running
- some minor cosmetic changes
- added the removal of window decorations such as the [X] button for the Budgie desktop. 


# Dead Switch Version 1.0.1

# Summary of changes

- hide config files
- encrypted password pointer file
- created a timeout for user input on the check-in window of 600 seconds
- disabled CTRL+C
- disabled window decorations like [X] button 
- edited reset file to cleanup all config and user files
