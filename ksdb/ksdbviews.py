from django.db.models import Q
from ksdb.models import person, publication, project, institution, fundedsite, protocol, organ, degree
from ksdb.ekeutils import _KSDBhref, getPersonNameByID
from django_datatables_view.base_datatable_view import BaseDatatableView

class PersonView(BaseDatatableView):
    model = person
    objtype = "person"

    # define the columns that will be returned
    columns = ['Select', 'id', 'firstname', 'lastname', 'telephone', 'email']

    order_columns = ["id",'id', 'firstname', 'lastname', 'telephone', 'email']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(PersonView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(firstname__icontains=search) | 
                           Q(id__icontains=search) | 
                           Q(lastname__icontains=search) | 
                           Q(telephone__icontains=search) |
                           Q(email__icontains=search) )
        return qs


class PublicationView(BaseDatatableView):
    model = publication
    objtype = "publication"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title', 'authors', 'pubmedid', 'pubyear']

    order_columns = ['id', 'id', 'title', 'authors', 'pubmedid', 'pubyear']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(PublicationView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(title__icontains=search) |
                           Q(id__icontains=search) |
                           Q(authors__icontains=search) |
                           Q(pubmedid__icontains=search) |
                           Q(pubyear__icontains=search) )
        return qs

class ProjectView(BaseDatatableView):
    model = project
    objtype = "project"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title', 'abbreviation']

    order_columns = ['id', 'id', 'title', 'abbreviation']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(ProjectView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(title__icontains=search) |
                           Q(id__icontains=search) |
                           Q(abbreviation__icontains=search))
        return qs


class InstitutionView(BaseDatatableView):
    model = institution
    objtype = "institution"
    # define the columns that will be returned
    columns = ['Select', 'id', 'name', 'abbreviation']

    order_columns = ['id', 'id', 'name', 'abbreviation']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(InstitutionView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(name__icontains=search) |
                           Q(id__icontains=search) |
                           Q(abbreviation__icontains=search))
        return qs


class FundedSiteView(BaseDatatableView):
    model = fundedsite
    objtype = "fundedsite"
    # define the columns that will be returned
    columns = ['Select', 'id', 'pis', 'status', 'description']

    order_columns = ['id', 'id', 'pis', 'status', 'description']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(FundedSiteView, self).render_column(row, column)
            if column == 'pis':
                pis = []
                for per in str(obj).split(","):
                    perid = getPersonNameByID(per)
                    if perid:
                        pis.append(perid)
                obj = ",".join(pis)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(pis__icontains=search) |
                           Q(id__icontains=search) |
                           Q(status__icontains=search) |
                           Q(description__icontains=search))
        return qs

class ProtocolView(BaseDatatableView):
    model = protocol
    objtype = "protocol"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title', 'shortname']

    order_columns = ['id' , 'id', 'title', 'shortname']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(ProtocolView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(title__icontains=search) |
                           Q(id__icontains=search) |
                           Q(shortname__icontains=search))
        return qs

class OrganView(BaseDatatableView):
    model = organ
    objtype = "organ"
    # define the columns that will be returned
    columns = ['Select', 'id', 'name']

    order_columns = ['id', 'id', 'name']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(OrganView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(name__icontains=search) |
                           Q(id__icontains=search))
        return qs

class DegreeView(BaseDatatableView):
    model = degree
    objtype = "degree"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title']

    order_columns = ['id', 'id', 'title']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(DegreeView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(title__icontains=search) |
                           Q(id__icontains=search))
        return qs
