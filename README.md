# gms2networkingframework
A framework for developing Gamemaker Studio 2 network based games, using GMS2 built in networking features. I haven't worked on this project for a while but I decided to post the whole thing up here. Hope this helps someone looking to implement these features into their game! Also remember to credit my work back here if you choose to use this in your project.


Here is a list of the currently added features:

Server:

Server can be hosted from the click of a button.

Can change Port, Max Clients and the Broadcast Name from within the program through text boxes.

Once the server is created it broadcasts its Max Clients and Broadcast Name across the port.

Designed with an network-event based system, so adding new network-events just requires adding the new network-event macro, in the macros script. Then creating and linking the event script to the async networking event of the server.

Server can have a password to control who can join.

Server can choose the map for the players to join on.



Client:

Client can join either through a direct connect or server browser.

Direct connect lets the user set their username, port  and ip-address for connecting to a server.

Server browser lets the user set a port to listen to and then it lists below the server names, ip-addresses and provides a join button.

Upon joining a server, the game then asks for a username and server password and connects.

In game, the client sends a ping event and a move event on each step. With the addition of a CLIENT_STEP macro the tick rate can be reduced.

The client can press the ‘Y’ key to halt the input object and take in a text input for chat functionality.

By pressing the left mouse button, the client can create a projectile which favours the client and does hit detection on the client side. Can be altered to do this on the other client or server side.

When hit by projectiles, the client camera shakes and the client takes damage.

When the client’s hp is 0, they die and then respawn after a set time at a team spawn point.

Spawn points can be placed for both teams, where the client will choose one which is not being covered.
