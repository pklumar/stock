# Run jenkins using docker
docker run -p 8080:8080 -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v /Users/parmodkumar/jenkins:/var/jenkins_home jenkins