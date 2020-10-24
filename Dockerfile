FROM nginx:1.19-alpine

COPY nginx/ /etc/nginx/

#Download javascript agent files from AppDynamics CDN
RUN mkdir -p /usr/share/nginx/html/adrum \
   && cd /usr/share/nginx/html/ \
   && wget -O adrum/adrum-latest.js http://cdn.appdynamics.com/adrum/adrum-latest.js \
   && wget http://cdn.appdynamics.com/adrum-ext.686372e97eae8d992d3f1df53d051927.js \
   && wget http://cdn.appdynamics.com/adrum-xd.686372e97eae8d992d3f1df53d051927.html


