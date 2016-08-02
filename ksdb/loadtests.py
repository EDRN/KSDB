from django.apps import AppConfig

class KSDBConfig(AppConfig):

    def ready(self):
        from tests import test_views
