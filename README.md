## Raspberry Pi Tor Proxy
A lightweight Docker image designed to run from a Raspberry Pi as a Tor Proxy for your local network.

### Configuration
In the _config_ file you need to change your network configuration to expose the proxy to your local network.
````bash
allowedClients = 127.0.0.1, 192.168.178.0/24 # Expose your network
````

### Build Docker Image
````bash
$ docker build -t tor-proxy .
````

### Usage
````bash
$ docker run -d -p 8123:8123 tor-proxy
````

### Use Proxy
In order to use the proxy service in your local network, use the IP Adress from your Pi and the port _8123_.
Check afterwards your Tor connection with https://check.torproject.org.
