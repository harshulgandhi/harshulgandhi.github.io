server {
    server_name www.harshulgandhi.com;
    root /home/gandhi.harshul.88/harshulgandhi;
    index index.html;
}
server {
    listen 80;
    server_name www.harshulgandhi.com;
}