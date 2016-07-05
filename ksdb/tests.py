from django.test import TestCase
from django.test import Client

# Create your tests here.

class ViewTests(TestCase):
	def testAppView(self):
		resp = self.client.get('/esis/')
		self.assertEqual(resp.status_code, 200)

	def testTestView(self):
		resp = self.client.get('/esis/test/')
		self.assertEqual(resp.status_code, 200)

	def testProfile(self):
		resp = self.client.post('/esis/profile/', {'user': 'DrkSephy'} )
		self.assertEqual(resp.status_code, 200)

	def testProfileContent(self):
		resp = self.client.post('/esis/profile/', {'user': 'DrkSephy'} )
		self.assertNotEqual(resp.content, '')
