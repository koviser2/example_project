upstream <%= socket_name %> {
  server unix:<%= unicorn_sock %> fail_timeout=0;
}

server{
  listen 80;
  server_name <%= site_name %> *.<%= site_name %>;
  access_log /var/log/nginx/<%= site_name %>_access.log;

  root <%= current_path %>/public;

  client_max_body_size 20m;

  if ($host != '<%= site_name %>' ) {
    rewrite ^/(.*)$ http://<%= site_name %>/$1 permanent;
  }

  location / {
    try_files $uri $uri @<%= socket_name %>;
  }

  location ^~ /assets/ {
    expires max;
    gzip_static on;
    add_header Cache-Control public;
  }
  
  location @<%= socket_name %> {
    proxy_redirect off;
    proxy_set_header Host $http_host;
    proxy_pass http://<%= socket_name %>;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_read_timeout 120s;
    proxy_send_timeout 120s;
    proxy_connect_timeout 120s;
  }
}
