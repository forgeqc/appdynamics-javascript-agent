FROM nginx:1.19-alpine

LABEL maintainer="32440697+matt6697@users.noreply.github.com"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="forgeqc/appdynamics-eum-agent"
LABEL org.label-schema.description="Nginx server hosting all of the AppDynamics javascript EUM agent files for on-premises deployment"
LABEL org.label-schema.vcs-url="https://github.com/forgeqc/appdynamics-eum-agent"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="forgeqc"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -p8080:8080 -d forgeqc/appdynamics-eum-agent"

#Configure Nginx
COPY nginx/ /etc/nginx/

#Download javascript agent files from AppDynamics CDN
RUN mkdir -p /usr/share/nginx/html/adrum \
   && cd /usr/share/nginx/html/ \
   && rm index.html 50x.html \
   && wget -O adrum/adrum-20.10.0.3321.js http://cdn.appdynamics.com/adrum/adrum-20.10.0.3321.js \
   && ln -s adrum-20.10.0.3321.js adrum/adrum-latest.js \
   && wget http://cdn.appdynamics.com/adrum-ext.686372e97eae8d992d3f1df53d051927.js \
   && wget http://cdn.appdynamics.com/adrum-xd.686372e97eae8d992d3f1df53d051927.html

EXPOSE 8080