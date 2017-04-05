#!/bin/bash

set -e

initfile=/etc/rundeck.init

chmod 1777 /tmp

# chown directories and files that might be coming from volumes
cp -R /var/lib/rundeck_ssh /var/lib/rundeck/.ssh
chown -R rundeck:rundeck /etc/rundeck
chown -R rundeck:rundeck /var/rundeck
chown -R rundeck:adm /var/log/rundeck
chown -R rundeck:rundeck /var/lib/rundeck
chown -R rundeck:rundeck /opt/rundeck-properties


if [ ! -f "${initfile}" ]; then
   SERVER_URL=${SERVER_URL:-"http://0.0.0.0:4440"}
   DATABASE_URL=${DATABASE_URL:-"jdbc:mysql://localhost/rundeckdb?autoReconnect=true"}
   RUNDECK_PASSWORD=${RUNDECK_PASSWORD:-$(pwgen -s 15 1)}

   echo "=>Initializing rundeck - This may take a few minutes"
   if [ "$(ls -A /etc/rundeck)" ]; then
       echo "=>/etc/rundeck check OK"
   else
       echo "=>/etc/rundeck empty...setting up defaults"
       cp -R /opt/rundeck-properties/* /etc/rundeck
       chown -R rundeck:rundeck /etc/rundeck
   fi

# Copy all plugins that are available on top of default and chowing those

   cp -R /opt/rundeck-plugins/* /var/lib/rundeck/libext
   chown -R rundeck:rundeck /var/lib/rundeck/libext

   sed -i 's,grails.serverURL\=.*,grails.serverURL\='${SERVER_URL}',g' /etc/rundeck/rundeck-config.properties
   sed -i 's,dataSource.dbCreate.*,,g' /etc/rundeck/rundeck-config.properties
   sed -i 's,dataSource.url = .*,dataSource.url = '${DATABASE_URL}',g' /etc/rundeck/rundeck-config.properties
   echo "dataSource.username = rundeck" >> /etc/rundeck/rundeck-config.properties
   echo "dataSource.password = ${RUNDECK_PASSWORD}" >> /etc/rundeck/rundeck-config.properties

touch ${initfile}
fi

. /lib/lsb/init-functions
. /etc/rundeck/profile

prog="rundeckd"
DAEMON="${JAVA_HOME:-/usr}/bin/java"
DAEMON_ARGS="${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck 4440"
rundeckd="$DAEMON $DAEMON_ARGS"

echo -n "Starting ${prog}"
su -s /bin/bash rundeck -c "$rundeckd"
