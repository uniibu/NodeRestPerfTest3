echo Staring Perfomance Test
rm -rf results.txt
echo "-----"
echo Express
echo -e "\nExpress" >> results.txt
node expressserver.js &
sleep 2
ab -k -n 50000 -c 100 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing expressserver
kill -0 $! && kill $!
sleep 2
echo ""
echo HapiJs
echo -e "\nHapiJs" >> results.txt ;
node hapiserver.js &
sleep 2
ab -k -n 50000 -c 100 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing hapiserver ;
kill -0 $! && kill $!
sleep 2
echo ""
echo Raw NodeJs
echo -e "\nRaw NodeJs" >> results.txt ;
node rawnodeserver.js &
sleep 2
ab -k -n 50000 -c 100 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing rawnodeserver ;
kill -0 $! && kill $!
sleep 2
echo ""
echo Restify
echo -e "\nRestify" >> results.txt ;
node restifyserver.js &
sleep 2
ab -k -n 50000 -c 100 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing restifyserver ;
kill -0 $! && kill $!
sleep 2
echo ""
echo Koa2
echo -e "\nKoa2" >> results.txt ;
node koa2server.js &
sleep 2
ab -k -n 50000 -c 100 http://127.0.0.1:8000/ | grep 'Time taken for tests:\|Requests per second:\|Time per request:' >> results.txt
echo Closing koa2server ;
kill -0 $! && kill $!
echo ""
sleep 2
echo Performance Test complete!
echo "-------------RESULT-------------"
cat results.txt
exit

