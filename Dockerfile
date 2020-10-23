FROM nginx:1.19-alpine

COPY nginx/ /etc/nginx/

#Download javascript agent files from AppDynamics CDN
RUN wget -O /usr/share/nginx/html/adrum-latest.js http://cdn.appdynamics.com/adrum/adrum-latest.js \
   && wget -O /usr/share/nginx/html/adrum-ext.js http://cdn.appdynamics.com/adrum-ext.f1b9622831c5f758b69f8c4fafbe9659.js \
   && wget -O /usr/share/nginx/html/adrum-xd.html http://cdn.appdynamics.com/adrum-xd.f1b9622831c5f758b69f8c4fafbe9659.html


