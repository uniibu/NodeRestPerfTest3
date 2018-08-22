echo Staring Perfomance Test
rm -rf results.txt
echo "-----"
echo Express
echo "\nExpress\n" >> results.txt ;
node expressserver.js & sleep 2 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing expressserver
kill -KILL $(pidof node)
sleep 2 
echo ""
echo HapiJs
echo "\nHapiJs\n" >> results.txt ;
node hapiserver.js & sleep 2 ;
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing hapiserver ;
kill -KILL $(pidof node)
sleep 2 
echo ""
echo Raw NodeJs
echo "\nRaw NodeJs\n" >> results.txt ;
node rawnodeserver.js & sleep 2 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing rawnodeserver ;
kill -KILL $(pidof node)
sleep 2
echo ""
echo Restify
echo "\nRestify\n" >> results.txt ;
node restifyserver.js & sleep 2 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing restifyserver ;
kill -KILL $(pidof node)
sleep 2
echo ""
echo Koa2
echo "\nKoa2\n" >> results.txt ;
node koa2server.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing koa2server ;
kill -KILL $(pidof node)
sleep 2
echo ""

echo Performance Test complete!
echo ""
cat results.txt
exit

