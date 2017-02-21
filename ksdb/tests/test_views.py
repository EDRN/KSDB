from django.test import TestCase
from django.contrib.auth.models import User

# Create your tests here.

class ViewTests(TestCase):
    #login to portal
    def createTestUser(self):
        self.username = 'tester'
        self.email = 'test@test.com'
        self.password = 'test'        
        self.test_user = User.objects.create_user(self.username, self.email, self.password)
        self.test_user.save()

    def login(self):
        logged_in = self.client.login(username=self.username, password=self.password)

    def test_LoginView(self):
        resp = self.client.get('/login/')
        self.assertEqual(resp.status_code, 200)
        self.assertIn('Please Sign In', resp.content)
        self.assertIn('Username:', resp.content)
        self.assertIn('Password:', resp.content)

    def test_ProjectView(self):
        self.createTestUser()
        self.login()
        resp = self.client.get('/ksdb/projectinput/', follow=True)
        self.assertEqual(resp.status_code, 200)
        self.assertIn('New Project', resp.content)
        self.assertIn('Project Title', resp.content)
        self.assertIn('Abbreviation', resp.content)
        
    def test_InstitutionView(self):
        self.createTestUser()
        self.login()
        resp = self.client.get('/ksdb/institutioninput/', follow=True)
        self.assertEqual(resp.status_code, 200)
        self.assertIn('New Institution', resp.content)
        self.assertIn('Name', resp.content)
        self.assertIn('Department', resp.content)
        
    def test_FundedSiteView(self):
        self.createTestUser()
        self.login()
        resp = self.client.get('/ksdb/fundedsiteinput/', follow=True)
        self.assertEqual(resp.status_code, 200)
        self.assertIn('New Funded Site', resp.content)
        self.assertIn('Institution', resp.content)
        self.assertIn('Projects', resp.content)
        
    def test_PersonnelView(self):
        self.createTestUser()
        self.login()
        resp = self.client.get('/ksdb/personinput/', follow=True)
        self.assertEqual(resp.status_code, 200)
        self.assertIn('New Personnel', resp.content)
        self.assertIn('First Name', resp.content)
        self.assertIn('Last Name', resp.content)
        
    def test_ProtocolView(self):
        self.createTestUser()
        self.login()
        resp = self.client.get('/ksdb/protocolinput/', follow=True)
        self.assertEqual(resp.status_code, 200)
        self.assertIn('New Protocol', resp.content)
        self.assertIn('Title', resp.content)
        self.assertIn('Protocol Description', resp.content)
        
    def test_PublicationView(self):
        self.createTestUser()
        self.login()
        resp = self.client.get('/ksdb/publicationinput/', follow=True)
        self.assertEqual(resp.status_code, 200)
        self.assertIn('New Publication', resp.content)
        self.assertIn('PubMed ID', resp.content)
        self.assertIn('Authors', resp.content)
        
    def test_OrganView(self):
        self.createTestUser()
        self.login()
        resp = self.client.get('/ksdb/organinput/', follow=True)
        self.assertEqual(resp.status_code, 200)
        self.assertIn('New Organ', resp.content)
        self.assertIn('Organ Name', resp.content)
        self.assertIn('Organ Description', resp.content)
        
    def test_DegreeView(self):
        self.createTestUser()
        self.login()
        resp = self.client.get('/ksdb/degreeinput/', follow=True)
        self.assertEqual(resp.status_code, 200)
        self.assertIn('New Degree', resp.content)
        self.assertIn('Degree Title', resp.content)
        self.assertIn('Degree Description', resp.content)
        

    #test if all tabs are in place
    def test_AppViewContent(self):
        resp = self.client.post('/ksdb/view/', follow=True )
        self.assertEqual(resp.status_code, 200)
        self.assertNotEqual(resp.content, '')
        self.createTestUser()
        self.login()
        resp = self.client.post('/ksdb/view/', follow=True )
        self.assertIn('Welcome to KSDB!', resp.content)
        self.assertIn('Projects', resp.content)
        self.assertIn('Institutions', resp.content)
        self.assertIn('Funded Sites', resp.content)
        self.assertIn('Personnel', resp.content)
        self.assertIn('Protocols', resp.content)
        self.assertIn('Publications', resp.content)
        self.assertIn('Organs', resp.content)
        self.assertIn('Degrees', resp.content)
        self.assertIn('KSDB RDFs', resp.content)
        self.assertIn('Diseases', resp.content)
        self.assertIn('Collaborative Groups', resp.content)
