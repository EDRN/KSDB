import datetime
from django.db import models
from tinymce.models import HTMLField

#Protocol related models
class protocol(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=128)
    shortname = models.CharField(max_length=128)
    organs = models.CharField(max_length=1000, blank=True, null=True)
    fundedsites = models.CharField(max_length=1000)
    pis = models.CharField(max_length=1000)
    cis = models.CharField(max_length=1000, blank=True, null=True)
    start_date = models.DateTimeField(blank=True, null=True)
    site_contact = models.CharField(max_length=500, blank=True, null=True)
    site_contact_email = models.EmailField(max_length=500, blank=True, null=True)
    irb_approval = models.CharField(max_length=128)
    irb_approval_num = models.CharField(max_length=128, blank=True, null=True)
    irb_contact = models.CharField(max_length=500, blank=True, null=True)
    irb_contact_email = models.EmailField(max_length=500, blank=True, null=True)
    hum_sub_train = models.CharField(max_length=128)
    abstract = models.CharField(max_length=500, blank=True, null=True)
    publications = models.CharField(max_length=1000, blank=True, null=True)
    data_custodians = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        db_table = u'protocol'

class pi_protocol_link(models.Model):
    protocolid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'pi_protocol_link'
        unique_together = (("protocolid", "personid"),)

class protocol_custodian_link(models.Model):
    protocolid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'protocol_custodian_link'
        unique_together = (("protocolid", "personid"),)

class protocol_publication_link(models.Model):
    protocolid = models.IntegerField()
    publicationid = models.IntegerField()

    class Meta:
        db_table = u'protocol_publication_link'
        unique_together = (("protocolid", "publicationid"),)

class ci_protocol_link(models.Model):
    protocolid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'ci_protocol_link'
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
    degrees = models.IntegerField(blank=True, null=True)
    email = models.EmailField(max_length=128, blank=True, null=True)
    telephone = models.CharField(max_length=500, blank=True, null=True)
    description = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        db_table = u'person'

#Program related models
class program(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=128)
    abbreviation = models.CharField(max_length=128, blank=True, null=True)
    description = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        db_table = u'program'


#Institution related models
class institution(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=128)
    department = models.CharField(max_length=128, blank=True, null=True)
    abbreviation = models.CharField(max_length=128, blank=True, null=True)
    url = models.URLField(max_length=500, blank=True, null=True)
    description = models.CharField(max_length=500, blank=True, null=True)
    personnel = models.CharField(max_length=500, blank=True, null=True)

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
    authors = models.CharField(max_length=5000)
    journal = models.CharField(max_length=500)
    pubyear = models.IntegerField()
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
    name = models.CharField(max_length=500)
    pis = models.CharField(max_length=500)
    status = models.CharField(max_length=500)
    organs = models.CharField(max_length=500, blank=True, null=True)
    staff = models.CharField(max_length=500, blank=True, null=True)
    programs = models.CharField(max_length=500)
    institutions = models.CharField(max_length=500)
    description = models.CharField(max_length=500, blank=True, null=True)
    contacts = models.CharField(max_length=500)
    funding_date_start = models.DateTimeField(blank=True, null=True)
    funding_date_finish = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = u'fundedsite'

class con_fundedsite_link(models.Model):
    fundedsiteid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'con_fundedsite_link'
        unique_together = (("fundedsiteid", "personid"),)

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

class fundedsite_program_link(models.Model):
    fundedsiteid = models.IntegerField()
    programid = models.IntegerField()

    class Meta:
        db_table = u'fundedsite_program_link'
        unique_together = (("programid", "fundedsiteid"),)

class fundedsite_institution_link(models.Model):
    fundedsiteid = models.IntegerField()
    institutionid = models.IntegerField()

    class Meta:
        db_table = u'fundedsite_institution_link'
        unique_together = (("fundedsiteid", "institutionid"),)

class fundedsite_protocol_link(models.Model):
    protocolid = models.IntegerField()
    fundedsiteid = models.IntegerField()

    class Meta:
        db_table = u'fundedsite_protocol_link'
        unique_together = (("protocolid", "fundedsiteid"),)

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

#Group related models
class group(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=500)
    members = models.CharField(max_length=500)
    programs = models.CharField(max_length=500)
    description = models.CharField(max_length=5000, blank=True, null=True)

    class Meta:
        db_table = u'collabgroup'

class group_member_link(models.Model):
    groupid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'group_member_link'
        unique_together = (("groupid", "personid"),)

class group_program_link(models.Model):
    groupid = models.IntegerField()
    programid = models.IntegerField()

    class Meta:
        db_table = u'group_program_link'
        unique_together = (("groupid", "programid"),)

#Disease related models
class disease(models.Model):
    id = models.IntegerField(primary_key=True)
    icd10 = models.CharField(max_length=128)
    description = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        db_table = u'disease'

class disease_protocol_link(models.Model):
    diseaseid = models.IntegerField()
    protocolid = models.IntegerField()

    class Meta:
        db_table = u'disease_protocol_link'
        unique_together = (("diseaseid", "protocolid"),)

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

