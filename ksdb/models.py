import datetime
from django.db import models
from tinymce.models import HTMLField

#Protocol related models
class protocol(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=128)
    description = models.CharField(max_length=500, blank=True, null=True)
    organs = models.CharField(max_length=1000)
    pis = models.CharField(max_length=1000)
    start_date = models.DateTimeField(blank=True, null=True)
    site_contact = models.CharField(max_length=500, blank=True, null=True)
    irb_approval = models.CharField(max_length=128)
    irb_approval_num = models.CharField(max_length=128)
    irb_contact = models.CharField(max_length=500, blank=True, null=True)
    hum_sub_train = models.CharField(max_length=128)
    abstract = HTMLField()

    class Meta:
        db_table = u'protocol'

class protocol_sitecon_link(models.Model):
    protocolid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'protocol_sitecon_link'
        unique_together = (("protocolid", "personid"),)

class protocol_irbcon_link(models.Model):
    protocolid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'protocol_irbcon_link'
        unique_together = (("protocolid", "personid"),)

class pi_protocol_link(models.Model):
    protocolid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'pi_protocol_link'
        unique_together = (("protocolid", "personid"),)

#Organ related models
class organ(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=128)
    description = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        db_table = u'organ'


class organ_protocol_link(models.Model):
    protocolid = models.IntegerField()
    organid = models.IntegerField()

    class Meta:
        db_table = u'organ_protocol_link'
        unique_together = (("protocolid", "organid"),)

#Person related models
class person(models.Model):
    id = models.IntegerField(primary_key=True)
    firstname = models.CharField(max_length=128)
    lastname = models.CharField(max_length=128)
    degrees = models.IntegerField()
    email = models.CharField(max_length=128)
    telephone = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        db_table = u'person'

#Project related models
class project(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=128)
    abbreviation = models.CharField(max_length=128, blank=True, null=True)
    description = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        db_table = u'project'


#Institution related models
class institution(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=128)
    department = models.CharField(max_length=128)
    abbreviation = models.CharField(max_length=128, blank=True, null=True)
    url = models.CharField(max_length=500)
    description = models.CharField(max_length=500, blank=True, null=True)
    personnel = models.CharField(max_length=500)

    class Meta:
        db_table = u'institution'

class institution_personnel_link(models.Model):
    institutionid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'institution_personnel_link'
        unique_together = (("institutionid", "personid"),)

#Publication related models
class publication(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=128)
    authors = models.CharField(max_length=500)
    journal = models.CharField(max_length=500)
    pubdate = models.DateTimeField()
    pubmedid = models.CharField(max_length=128)

    class Meta:
        db_table = u'publication'

class publication_author_link(models.Model):
    publicationid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'publication_author_link'
        unique_together = (("publicationid", "personid"),)

#Fundedsite related models
class fundedsite(models.Model):
    id = models.IntegerField(primary_key=True)
    pis = models.CharField(max_length=500)
    organs = models.CharField(max_length=500)
    staff = models.CharField(max_length=500)
    projects = models.CharField(max_length=500)
    institutions = models.CharField(max_length=500)
    description = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        db_table = u'fundedsite'

class fundedsite_pi_link(models.Model):
    fundedsiteid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'fundedsite_pi_link'
        unique_together = (("fundedsiteid", "personid"),)

class fundedsite_staff_link(models.Model):
    fundedsiteid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'fundedsite_staff_link'
        unique_together = (("fundedsiteid", "personid"),)

class fundedsite_organ_link(models.Model):
    fundedsiteid = models.IntegerField()
    organid = models.IntegerField()

    class Meta:
        db_table = u'fundedsite_organ_link'
        unique_together = (("fundedsiteid", "organid"),)

class fundedsite_project_link(models.Model):
    fundedsiteid = models.IntegerField()
    projectid = models.IntegerField()

    class Meta:
        db_table = u'fundedsite_project_link'
        unique_together = (("projectid", "fundedsiteid"),)

class fundedsite_institution_link(models.Model):
    fundedsiteid = models.IntegerField()
    institutionid = models.IntegerField()

    class Meta:
        db_table = u'fundedsite_institution_link'
        unique_together = (("fundedsiteid", "institutionid"),)

#Degree related models
class degree(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=128)
    description = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        db_table = u'degree'


class person_degree_link(models.Model):
    personid = models.IntegerField()
    degreeid = models.IntegerField()

    class Meta:
        db_table = u'person_degree_link'
        unique_together = (("personid", "degreeid"),)

#Person related models

class IdSeq(models.Model):
    """
    This class maps to input_file_id_seq which is a PostgreSQL sequence.
    This sequence runs from 1 to 9999 after which it restarts (cycles) at 1.
    A sequence is basically a special single row table.
    """
    sequence_name = models.CharField(max_length=128, primary_key=True)
    last_value = models.IntegerField()
    increment_by = models.IntegerField()
    max_value = models.IntegerField()
    min_value = models.IntegerField()
    cache_value = models.IntegerField()
    log_cnt = models.IntegerField()
    is_cycled = models.BooleanField()
    is_called = models.BooleanField()

