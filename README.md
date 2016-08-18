# KSDB

Knowledge System DB: The goal of this system is to maintain generalized project information to be used for any bioinformatics knowledge system that the JPL Informatics Center supports. For example, EDRN or MCL.

# Setup
# Make sure to create a virtual environment
pip install -r conf/dependencies.cfg

#Create postgres database in server
# 1. run conf/createtables.sql in postgres database

# Preferrably use a virtual environment before you deploy
# Create superuser
python manage.py migrate
python manage.py createsuperuser

# Running the project
To run this project:

    # etup the database
    #Make sure to change db, username, password in sitemain/settings.py for postgres database to reflect your database
    python manage.py migrate
    python manage.py makemigrations

    #ingest organs into database
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
