# Build and run hello server

#### Note: make sure vagrant is installed on your host system

## Checkout source code
In the current folder, checkout source code to the parent folder
```sh
git clone https://github.com/drines-uc/hello_http.git ../hello_http
```
If you checkout the source code to a different location or under a different name, make sure to modify the synced_folder in Vagrantfile to reflect the source code folder.
```sh
config.vm.synced_folder "<source code location>", "/hello_server"
```

## Start VM to build and run hello server
```sh
vagrant up
```

## Access hello webserver 
Once vagrant has brought up the VM, go to your browser and access the hello server
[http://127.0.0.1:12344/] or [http://localhost:12344/]

## Shutdown VM
When done, shutdown or destroy the VM
```sh
vagrant halt
```
or
```sh
vagrant destroy
```
