Project 3

For the beans version my jstl libs were working locally but not when i deployed it in infserver,
so i copied some info in mey dd and some libs in my WEB-INF folder from the first working application i found.
I send cookies with a nasty scriplet and i leave the rest of the work to EL and jstl.

In the scriptlet version the a single file, index.jsp does all the work. 

The cookie sender mechanism is the same in both versions. It Checks if we have a request, if not it checks for cookies
and if thats false too it init the values to 0. What i succed by that is checking for cookies only if it is the 
first time i open the application. In the bean version i do the checks with <c:choose>.

There is nothing else hard to see in my files.