#!/bin/bash
# todo: copy all pk3s in env variable 'MOHCFG_MODS'?

cd /home/container
wget http://185.224.131.90/MOHAA.zip
unzip MOHAA.zip
rm -rf MOHAA.zip



# Replace all config placeholders with environment variables
sed -Ei "s/cfg.sv_hostname/${MOHCFG_HOSTNAME}/g" server-env.cfg
sed -Ei "s/cfg.rconpassword/${MOHCFG_RCONPASS}/g" server-env.cfg
sed -Ei "s/cfg.password/${MOHCFG_PASSWORD}/g" server-env.cfg

# Copy the server config file into place
cp server-env.cfg main/server.cfg

# Copy realism if required
if [[ "${MOHCFG_REALISM}" = "true" ]]; then
  cp paks/User_sbrealism.pk3 main/
else
  cp paks/User_sbdefault.pk3 main/
fi

# Run the Server
chmod 775 /home/cointainer/
/home/container/mohaa_lnxded +set dedicated 2 +set sv_maxclients 32 +set net_ip 0.0.0.0 +set net_port {{SERVER_PORT}} +exec server.cfg
