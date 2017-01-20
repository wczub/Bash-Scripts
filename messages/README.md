# startUp.sh
##What this does
This is a little script to print a welcome message, and a programming quote when I log into my server. The dashed lines fill out to the edge of the terminal window, while the stars (asterisks) fill out to the edge as well centering the welcome message. The quote is left aligned and wraps on spaces, while the author is right aligned to the edge of the terminal window or the end of the quote depending on which is smaller.
##How to get it to work
This script is called from .bashrc using ". ~/bin/startUp.sh"
Since it is located in the .bashrc file, it is called whenever I log in.
##Output
\---------------------------------------------------------------------------
*****************            Welcome back Will!           *****************

If debugging is the process of removing software bugs, then programming
must be the process of putting them in.
                                                           -Edsger Dijkstra
\---------------------------------------------------------------------------
