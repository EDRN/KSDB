from django.test import TestCase
from ksdb.models import *

#test creations of models
class ModelTests(TestCase):
    def create_protocol(self, id=1, title="only a test", organs="lung", pis="tester", irb_approval="yes", hum_sub_train="yes", abstract="test abstract"):
        return protocol.objects.create(id=id, title=title, organs=organs, pis=pis, irb_approval=irb_approval, hum_sub_train=hum_sub_train, abstract=abstract)

    def create_project(self, id=1, title="only a test"):
        return project.objects.create(id=id, title=title)

    def create_institution(self, id=1, name="test", url='test://test', personnel='tester'):
        return institution.objects.create(id=id, name=name, url=url, personnel=personnel)

    def create_fundedsite(self, id=1, pis="tester", projects='test', institutions='test'):
        return fundedsite.objects.create(id=id, pis=pis, projects=projects, institutions=institutions)

    def create_person(self, id=1, firstname="test", lastname='er', degrees=1, email='test@test.test'):
        return person.objects.create(id=id, firstname=firstname, lastname=lastname, degrees=degrees, email=email)

    def create_publication(self, id=1, title="test", authors='tester', journal='test', pubyear=2016, pubmedid=5):
        return publication.objects.create(id=id, title=title, authors=authors, journal=journal, pubyear=pubyear, pubmedid=pubmedid)

    def create_organ(self, id=1, name="test"):
        return organ.objects.create(id=id, name=name)

    def create_degree(self, id=1, title="test"):
        return degree.objects.create(id=id, title=title)

    def test_model_creation(self):
        p = self.create_protocol()
        self.assertTrue(isinstance(p, protocol))

        p = self.create_project()
        self.assertTrue(isinstance(p, project))

        p = self.create_institution()
        self.assertTrue(isinstance(p, institution))

        p = self.create_fundedsite()
        self.assertTrue(isinstance(p, fundedsite))

        p = self.create_person()
        self.assertTrue(isinstance(p, person))

        p = self.create_publication()
        self.assertTrue(isinstance(p, publication))

        p = self.create_organ()
        self.assertTrue(isinstance(p, organ))

        p = self.create_degree()
        self.assertTrue(isinstance(p, degree))

