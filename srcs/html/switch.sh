cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/tmp
cp /etc/nginx/conf.d/option /etc/nginx/conf.d/default.conf
cp /etc/nginx/conf.d/tmp /etc/nginx/conf.d/option
rm -rf /etc/nginx/conf.d/tmp
service nginx restart