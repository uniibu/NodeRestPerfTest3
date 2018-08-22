echo Staring Perfomance Test
echo Express
echo express >> results.txt ;
node expressserver.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
echo closing expressserver ;
pkill -f expressserver > /dev/null 2>&1;
sleep 5 
echo ""
echo HapiJs
echo hapi >> results.txt ;
node hapiserver.js & sleep 5 ;
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
echo closing hapiserver ;
pkill -f hapiserver > /dev/null 2>&1;
sleep 5 
echo ""
echo Raw NodeJs
echo node >> results.txt ;
node rawnodeserver.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f rawnodeserver > /dev/null 2>&1;
sleep 5 
echo ""
echo Restify
echo restify >> results.txt ;
node restifyserver.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f restifyserver > /dev/null 2>&1;
sleep 5 
echo ""
echo Koa2
echo koa2 >> results.txt ;
node koa2server.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f koa2server > /dev/null 2>&1;
sleep 5 


