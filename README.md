# KSDB

Knowledge System DB: The goal of this system is to maintain generalized project information to be used for any bioinformatics knowledge system that the JPL Informatics Center supports. For example, EDRN or MCL.

#DEPENDENCIES

sudo yum install postgresql94-server postgresql94-devel gcc openldap-devel

#SETUP POSTGRES

#setup postgres
    initi db sudo service postgresql94 initdb
    sudo chkconfig postgresql94 on
    sudo service postgresql94 start
    sudo -i -u postgres
    modify /var/lib/pgsql94/data/pg_hba.conf so that all "peer" methods are changed to "md5"
    createuser -s edrn --password   (set password to edrn)
    createdb ksdb -
    psql
        create database ksdb;
        GRANT ALL ON database ksdb TO edrn;

#insert tables
    ctrl^D twice, once to exit out of database, second time to exit out of postgres user account
    export PGPASSWORD=edrn
    psql -U edrn -d ksdb -a -f conf/createtables.sql

# SETUP KSDB

# Make sure to create a virtual environment
    sudo pip install setuptools --upgrade
    sudo pip install -r conf/dependencies.cfg

# Configure KSDB
    modify conf/settings.py to update DATABASES parameter. Make sure you updated 'name' to ksdb, 'user' to edrn, and 'password' to edrn.
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
