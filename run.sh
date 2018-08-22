echo Staring Perfomance Test
rm -rf results.txt
echo "-----"
echo Express
echo Express >> results.txt ;
node expressserver.js & sleep 2 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt ;
echo closing expressserver ;
kill -KILL $(pidof node)
sleep 2 
echo ""
echo HapiJs
echo HapiJs >> results.txt ;
node hapiserver.js & sleep 2 ;
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt ;
echo closing hapiserver ;
kill -KILL $(pidof node)
sleep 2 
echo ""
echo Raw NodeJs
echo Raw NodeJs >> results.txt ;
node rawnodeserver.js & sleep 2 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt ;
kill -KILL $(pidof node)
sleep 2
echo ""
echo Restify
echo Restify >> results.txt ;
node restifyserver.js & sleep 2 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt ;
kill -KILL $(pidof node)
sleep 2
echo ""
echo Koa2
echo Koa2 >> results.txt ;
node koa2server.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt ;
kill -KILL $(pidof node)
sleep 2
echo ""

echo Performance Test complete!
echo ""
cat results.txt

