#!/usr/bin/env sh

function checkError {
        if [ $1 -ne 0 ]; then
                echo "ERROR"
                exit $1
        fi
        echo "OK"
}

rc=0 

echo "Starting service ${SERVICE_NAME}"
echo "127.0.0.1 inventory payments shipping" >> /etc/hosts
${SERVICE_HOME}/bin/nginx-config.sh
${SERVICE_HOME}/bin/nginx 
SERVICE_PID=$(cat ${SERVICE_HOME}/run/nginx.pid)

sleep 5

echo "Testing service ${SERVICE_NAME}"
CURRENT_VERSION=$(curl -sSw '%{http_code}' localhost:8080 -o /dev/null)
if [ $? -ne 0 ]; then
	sleep 5
	CURRENT_VERSION=$(curl -sSw '%{http_code}' localhost:8080 -o /dev/null)
fi

SERVICE_EXPECTED="200"

if [ "$CURRENT_VERSION" != "$SERVICE_EXPECTED" ]; then
        echo "ERROR got $CURRENT_VERSION expected $SERVICE_EXPECTED"
        rc=1
fi

echo "OK"
echo "Stoping service ${SERVICE_NAME}"
kill -15 $SERVICE_PID
exit $rc