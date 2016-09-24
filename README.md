# KSDB

Knowledge System DB: The goal of this system is to maintain generalized project information to be used for any bioinformatics knowledge system that the JPL Informatics Center supports. For example, EDRN or MCL.

#DEPENDENCIES

sudo yum install postgresql-server postgresql-devel gcc openldap-devel openssl openssl-devel
python3:
    curl -O https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz
    tar xf Python-3.5.0.tgz
    cd Python-3.5.0
    ./configure
    make
    sudo make altinstall
pip3:
    curl -O https://bootstrap.pypa.io/get-pip.py
    sudo python3 get-pip.py 

#SETUP POSTGRES

#setup postgres
    sudo service postgresql initdb
    sudo chkconfig postgresql on
    sudo service postgresql start
    modify /var/lib/pgsql/data/pg_hba.conf so that all "ident" methods are changed to "md5"
    sudo -i -u postgres createuser -s edrn --password   (set password to edrn)
    sudo -i -u postgres psql 
        create database ksdb;
        alter user edrn password 'edrn';
        GRANT ALL ON database ksdb TO edrn;

#insert tables
    ctrl^D once to exit out of database
    sudo service postgresql restart
    export PGPASSWORD=edrn
    psql -U edrn -h 127.0.0.1 -d ksdb -a -f conf/createtables.sql

# SETUP KSDB

# Make sure to create a virtual environment
    sudo pip install setuptools --upgrade
    sudo pip install -r conf/dependencies.cfg

# Configure KSDB
    modify sitemain/settings.py to update DATABASES parameter. Make sure you updated 'name' to ksdb, 'user' to edrn, 'password' to edrn, and host to localhost.
    python manage.py migrate auth
    python manage.py migrate
    python manage.py createsuperuser (create the user you will be using to login)
    
# Running the project
    To run this project:

    #ingest knowledge objects from CancerDataExpo into database
    python manage.py ingestorgans
    python manage.py ingestpublications
    python manage.py ingestpersons


# Run the server
python manage.py runserver 0.0.0.0:8000

You can now visit the following URLS:

* http://127.0.0.1:8000/
* http://127.0.0.1:8000/ksdb/view/

# Tests

Run the test suite:

python manage.py test ksdb
