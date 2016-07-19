from rdflib import Graph, Literal, BNode, Namespace, RDF, URIRef
from rdflib.namespace import DC, FOAF

g = Graph()


g.parse('publications.rdf', format='xml')

# Bind a few prefix, namespace pairs for more readable output

print( g.serialize(format='n3') )
