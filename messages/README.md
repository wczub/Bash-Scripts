# startUp.sh
## What this does
This is a little script to print a welcome message, and a programming quote when I log into my server. The dashed lines fill out to the edge of the terminal window, while the stars (asterisks) fill out to the edge as well centering the welcome message. The quote is left aligned and wraps on spaces, while the author is right aligned to the edge of the terminal window or the end of the quote depending on which is smaller.
## How to get it to work
Copy this file into your workspace, and make it an executable. I have mine placed in "~/bin/" as that is where a few of my scripts go. Then call it from your .bashrc using ". ~/bin/startUp.sh". 
Since it is located in the .bashrc file, it is called whenever I log in.
### Extra Information
Feel free to change the quotes, but make sure to change the author as well. The first spot in the quote array corresponds to the first spot in the author array. If you would like to add more than 10 quotes 
## Output
```text
---------------------------------------------------------------------------

*****************            Welcome back Will!           *****************

If debugging is the process of removing software bugs, then programming
must be the process of putting them in.
                                                           
   
                                                            -Edsger Dijkstra
                                                           
---------------------------------------------------------------------------
```
# close.sh
## What this does
This is a small script to say Good Bye, when I logout of the my server. It works in much the same way as the welcome message, using the same code. The main difference is that it waits two seconds before letting the session end.
## How to get it to work
Copy this file into your workspace, and make it an executable. I have mine placed in "~/bin/" as that is where a few of my scripts go. Then call it from your .bashrc using ". ~/bin/close.sh". 
## Output
```text
--------------------------------------------------------------------------------
**********************           Good Bye Will!           **********************

--------------------------------------------------------------------------------
```
