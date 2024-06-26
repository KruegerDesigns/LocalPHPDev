# LocalPHPDev Environment

This repository provides a local PHP development environment using Docker, Apache, PHP-FPM, and Dnsmasq. It allows you to develop multiple PHP sites locally with automatic handling of `.loc` domains.

## Acknowledgments

This project was inspired by the work of [Chris Cherry](https://github.com/ctcherry). Special thanks for his valuable ideas and years of support.

## Features

- Apache with mod_proxy_fcgi for handling PHP requests
- PHP-FPM for PHP processing
- Dnsmasq for local domain resolution
- Support for `.htaccess` files in projects
- Automatic handling of `index.html` and `index.php` files as default index files

## Prerequisites

- Docker
- Docker Compose

## Setup

1. **Clone the Repository**

   ```sh
   git clone https://github.com/KruegerDesigns/LocalPHPDev.git
   cd LocalPHPDev
   ```

2. **Create the Required Directories**

   Ensure the following directories exist and are properly structured:

   ```
   LocalPHPDev/
   ├── sites/
   │   ├── site1.loc/
   │   └── test.loc/
   ├── logs/
   ├── .env
   ├── docker-compose.yml
   ├── Makefile
   └── apache/
       ├── Dockerfile
       └── vhost.conf
   ```

3. **Set Up .env Variables**

   Set the paths to where you will be creating your Website folders, also set the path to where you would like the server logs stored.

   In the `.env` file setup the correct paths, `USERNAME` should be changed to your local user:

   ```sh
   SITES_PATH=/Users/USERNAME/Projects/Sites
   LOGS_PATH=/Users/USERNAME/Projects/Sites/logs
   ```

4. **Set Up DNS Resolution**

   Ensure your macOS system is set up to resolve `.loc` domains by creating the `/etc/resolver/loc` file with the following content:

   ```sh
   sudo mkdir -p /etc/resolver
   echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/loc
   ```

## Usage

### Building and Starting the Containers

1. **Clean Docker System Resources**

   ```sh
   make prune
   ```

2. **Rebuild the Docker Images**

   ```sh
   make rebuild
   ```

3. **Build and Start Containers**

   ```sh
   make up
   ```

4. **Check Logs for Errors**

   If there are issues, check the logs for more information:

   ```sh
   make logs
   ```

### Using `.htaccess` Files

In each project where you want to enable PHP in `.html` files and set the default index files, create an `.htaccess` file with the following content:

```apache
# Allow PHP code in .html files
AddType application/x-httpd-php .html
```

## Makefile Commands

- `make build` - Build the Docker images
- `make up` - Build and start the Docker containers
- `make down` - Stop and remove the Docker containers
- `make logs` - Display logs of the Docker containers
- `make clean` - Remove all Docker containers, images, and volumes
- `make prune` - Clean up Docker system resources
- `make rebuild` - Rebuild the Docker images without using the cache
- `make restart` - Restart the Docker containers
- `make pull-images` - Manually pull Docker images

## License

This project is licensed under the MIT License.
```
