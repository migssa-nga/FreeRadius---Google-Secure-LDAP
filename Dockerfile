FROM freeradius/freeradius-server:3.0.19

COPY configs/clients.conf /etc/freeradius/3.0/clients.conf
COPY configs/default /etc/freeradius/3.0/sites-available/default
COPY configs/inner-tunnel /etc/freeradius/3.0/sites-available/inner-tunnel
COPY configs/ldap /etc/freeradius/3.0/mods-available/ldap
COPY configs/eap /etc/freeradius/3.0/mods-enabled/eap
COPY configs/proxy.conf /etc/freeradius/proxy.conf
COPY init.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init.sh
RUN ln -s /etc/freeradius/3.0/mods-available/ldap /etc/freeradius/3.0/mods-enabled/ldap

ENTRYPOINT ["/usr/local/bin/init.sh"]

CMD ["freeradius"]
