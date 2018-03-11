from django.db.models import Q
from ksdb.models import person, publication, program, institution, fundedsite, protocol, organ, degree, group, disease, committee, discipline, species, specimentype
from ksdb.ekeutils import _KSDBhref, getPersonNameByID, getProgramTitleByID
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
    columns = ['Select', 'id', 'programs', 'title', 'authors', 'pubmedid', 'pubyear']

    order_columns = ['id', 'id', 'programs', 'title', 'authors', 'pubmedid', 'pubyear']
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
                           Q(programs__icontains=search) |
                           Q(authors__icontains=search) |
                           Q(pubmedid__icontains=search) |
                           Q(pubyear__icontains=search) )
        return qs

class ProgramView(BaseDatatableView):
    model = program
    objtype = "program"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title', 'abbreviation']

    order_columns = ['id', 'id', 'title', 'abbreviation']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(ProgramView, self).render_column(row, column)
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


class CommitteeView(BaseDatatableView):
    model = committee
    objtype = "committee"
    # define the columns that will be returned
    columns = ['Select', 'id', 'abbreviation', 'programs', 'members']

    order_columns = ['id', 'id', 'abbreviation', 'programs', 'members']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(CommitteeView, self).render_column(row, column)
            if column == 'members':
                members = []
                for per in str(obj).split(","):
                    perid = getPersonNameByID(per)
                    if perid:
                        members.append(perid)
                obj = ",".join(members)
            if column == 'programs':
                programs = []
                for pro in str(obj).split(","):
                    proid = getProgramTitleByID(pro)
                    if proid:
                        programs.append(proid)
                obj = ",".join(programs)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(members__icontains=search) |
                           Q(id__icontains=search) |
                           Q(programs__icontains=search) |
                           Q(abbreviation__icontains=search) |
                           Q(description__icontains=search))
        return qs

class GroupView(BaseDatatableView):
    model = group
    objtype = "group"
    # define the columns that will be returned
    columns = ['Select', 'id', 'name', 'programs', 'members']

    order_columns = ['id', 'id', 'name', 'programs', 'members']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(GroupView, self).render_column(row, column)
            if column == 'members':
                members = []
                for per in str(obj).split(","):
                    perid = getPersonNameByID(per)
                    if perid:
                        members.append(perid)
                obj = ",".join(members)
            if column == 'programs':
                programs = []
                for pro in str(obj).split(","):
                    proid = getProgramTitleByID(pro)
                    if proid:
                        programs.append(proid)
                obj = ",".join(programs)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)

    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(members__icontains=search) |
                           Q(id__icontains=search) |
                           Q(programs__icontains=search) |
                           Q(name__icontains=search) |
                           Q(description__icontains=search))
        return qs

class FundedSiteView(BaseDatatableView):
    model = fundedsite
    objtype = "fundedsite"
    # define the columns that will be returned
    columns = ['Select', 'id', 'name', 'programs', 'pis', 'status', 'description']

    order_columns = ['id', 'id', 'name', 'programs', 'pis', 'status', 'description']
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
            if column == 'programs':
                programs = []
                for pro in str(obj).split(","):
                    proid = getProgramTitleByID(pro)
                    if proid:
                        programs.append(proid)
                obj = ",".join(programs)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(pis__icontains=search) |
                           Q(id__icontains=search) |
                           Q(programs__icontains=search) |
                           Q(name__icontains=search) |
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

class DiseaseView(BaseDatatableView):
    model = disease
    objtype = "disease"
    # define the columns that will be returned
    columns = ['Select', 'id', 'icd10']

    order_columns = ['id', 'id', 'icd10']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(DiseaseView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(icd10__icontains=search) |
                           Q(id__icontains=search))
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

class DisciplineView(BaseDatatableView):
    model = discipline
    objtype = "discipline"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title']

    order_columns = ['id', 'id', 'title']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(DisciplineView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(title__icontains=search) |
                           Q(id__icontains=search))
        return qs

class SpecimenTypeView(BaseDatatableView):
    model = specimentype
    objtype = "specimentype"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title']

    order_columns = ['id', 'id', 'title']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(SpecimenTypeView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(title__icontains=search) |
                           Q(id__icontains=search))
        return qs

class SpeciesView(BaseDatatableView):
    model = species
    objtype = "species"
    # define the columns that will be returned
    columns = ['Select', 'id', 'title']

    order_columns = ['id', 'id', 'title']
    max_display_length = 500

    def render_column(self, row, column):
        # We want to render user as a custom column
        if column == 'Select':
            return '<input type="checkbox" name="{0}" id="{1}">'.format(self.objtype, row.id)
        else:
            obj = super(SpeciesView, self).render_column(row, column)
            return '<a href="{0}{1}input/?id={2}">{3}</a>'.format(_KSDBhref, self.objtype, row.id, obj)
    def filter_queryset(self, qs):
        search = self.request.GET.get(u'search[value]', None)
        if search:
            qs = qs.filter(Q(title__icontains=search) |
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
