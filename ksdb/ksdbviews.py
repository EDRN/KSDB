from models import person, publication, project, institution, fundedsite, protocol, organ, degree
from ekeutils import clean_unicode_str, _KSDBhref
from django_datatables_view.base_datatable_view import BaseDatatableView

class PersonView(BaseDatatableView):
    model = person
    objtype = "person"

    # define the columns that will be returned
    columns = ['Select', 'id', 'firstname', 'lastname', 'telephone', 'email']

    order_columns = ['id']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = clean_unicode_str(super(PersonView, self).render_column(row, column))
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

class PublicationView(BaseDatatableView):
    model = publication
    objtype = "publication"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title', 'authors', 'pubmedid', 'pubyear']

    order_columns = ['id']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = clean_unicode_str(super(PublicationView, self).render_column(row, column))
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

class ProjectView(BaseDatatableView):
    model = project
    objtype = "project"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title', 'abbreviation']

    order_columns = ['id']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = clean_unicode_str(super(ProjectView, self).render_column(row, column))
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

class InstitutionView(BaseDatatableView):
    model = institution
    objtype = "institution"
    # define the columns that will be returned
    columns = ['Select', 'id', 'name', 'abbreviation']

    order_columns = ['id']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = clean_unicode_str(super(InstitutionView, self).render_column(row, column))
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

class FundedSiteView(BaseDatatableView):
    model = fundedsite
    objtype = "fundedsite"
    # define the columns that will be returned
    columns = ['Select', 'id', 'pis', 'status', 'description']

    order_columns = ['id']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = clean_unicode_str(super(FundedSiteView, self).render_column(row, column))
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

class ProtocolView(BaseDatatableView):
    model = protocol
    objtype = "protocol"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title', 'shortname']

    order_columns = ['id']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = clean_unicode_str(super(ProtocolView, self).render_column(row, column))
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

class OrganView(BaseDatatableView):
    model = organ
    objtype = "organ"
    # define the columns that will be returned
    columns = ['Select', 'id', 'name']

    order_columns = ['id']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = clean_unicode_str(super(OrganView, self).render_column(row, column))
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

class DegreeView(BaseDatatableView):
    model = degree
    objtype = "degree"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title']

    order_columns = ['id']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = clean_unicode_str(super(DegreeView, self).render_column(row, column))
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)


