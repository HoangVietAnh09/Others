Occasionally you want a bit more information about how much data something within a web application returns. This could be anything from a file, a response code (i.e. 404 meaning the URL doesn't exist) or the parameters used in a form similar to the form you attacked

you want to see if you can view notes by other users

Our wfuzz command would like the following: ```wfuzz -c -z file,/usr/share/wordlists/dirb/big.txt localhost:80/FUZZ/note.txt```

Note how the "FUZZ" parameter is being replaced with the words from the wordlist. We'll outline some of the options that can be configured in wfuzz, however, it's worth knowing that will display results that are different to the parameters that we set

I have added some of the more useful options into the table below:

|Options 	|Description
|:-|:-
|-c 	|Shows the output in color
|-d 	|Specify the parameters you want to fuzz with, where the data is encoded for a HTML form
|-z 	|Specifies what will replace FUZZ in the request. For example -z file,big.txt. We're telling wfuzz to look for files by replacing "FUZZ" with the words within "big.txt"
|--hc 	|Don't show certain http response codes. I.e. Don't show 404 responses that indicate the file doesn't exist, or "200" to indicate the file does exist
|--hl 	|Don't show for a certain amount of lines in the response
|--hh 	|Don't show for a certain amount of characters

Fuzz parameters

```wfuzz -c -z file,mywordlist.txt -d “username=FUZZ&password=FUZZ” -u http://shibes.thm/login.php```

