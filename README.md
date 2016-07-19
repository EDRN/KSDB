# KSDB

Knowledge System DB: The goal of this system is to maintain generalized project information to be used for any bioinformatics knowledge system that the JPL Informatics Center supports. For example, EDRN or MCL.


# Setup

pip install -r conf/dependencies.cfg



# Running the project

To run this project:

    # Setup the database
    Change db, username, password in sitemain/settings.py for postgres database to reflect your database
    sh conf/initdb.sh
    python manage.py migrate
    python manage.py makemigrations

    #ingest organs into database
    python manage.py ingestorgans

    # Run the server
    python manage.py runserver 0.0.0.0:8000

You can now visit the following URLS:

	* http://127.0.0.1:8000/ksdb/
	* http://127.0.0.1:8000/ksdb/test/
	* http://127.0.0.1:8000/ksdb/profile/

# Tests

Run the test suite:

    python manage.py test
