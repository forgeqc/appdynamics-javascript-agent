FROM nginx:1.19-alpine

LABEL maintainer="32440697+matt6697@users.noreply.github.com"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="forgeqc/appdynamics-javascript-agent"
LABEL org.label-schema.description="Nginx server hosting all of the AppDynamics javascript EUM agent files for on-premises deployment"
LABEL org.label-schema.vcs-url="https://github.com/forgeqc/appdynamics-javascript-agent"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="forgeqc"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -p8080:8080 -d forgeqc/appdynamics-javascript-agent"

# Configure Nginx
COPY nginx/ /etc/nginx/

# Prepare NGINX web directory
RUN mkdir -p /usr/share/nginx/html/adrum \
   && cd /usr/share/nginx/html/ \
   && rm index.html 50x.html 

# Copy javascript agent files dowloaded from AppDynamics CDN
ADD target /usr/share/nginx/html/

EXPOSE 8080