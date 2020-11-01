#!/bin/bash
# todo: copy all pk3s in env variable 'MOHCFG_MODS'?

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
