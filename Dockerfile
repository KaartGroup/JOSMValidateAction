FROM debian:latest
RUN mkdir -p /etc/sources.list.d/ && \
      apt-get update && \
      apt-get install -y wget gnupg2 && \
      wget -q https://josm.openstreetmap.de/josm-apt.key -O- | gpg --dearmor > /usr/share/keyrings/josm.gpg && \
      echo 'deb [signed-by=/usr/share/keyrings/josm.gpg] https://josm.openstreetmap.de/apt alldist universe' >> /etc/sources.list.d/josm && \
      apt-get update && \
      apt-get install -y josm && \
      apt-get clean
