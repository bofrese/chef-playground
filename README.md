# Chef Playground

This is a simple Docker setup to quickly provide a playground to experiment with chef

It provides an ubuntu Docker image with chef-workstation installed, 
and a Makefile to quickly get it up and running and connect.

To run it simple use :

    make run

To connect :

    make connect

To stop the image

    make stop

To remove it entirely

    make remove

Note: It mounts the current directory as /chef inside the image,
so you can use your favorite editor to edit cookbooks etc., 
while (obviously) running chef inside the docker image 
(use `make connect` to get a prompt)



