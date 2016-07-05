import datetime
from django.db import models
from tinymce.models import HTMLField

#Protocol related models
class protocol(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=128)
    description = models.CharField(max_length=500)
    organs = models.CharField(max_length=1000)
    pis = models.CharField(max_length=1000)
    start_date = models.DateTimeField()
    site_contact = models.CharField(max_length=128)
    irb_approval = models.CharField(max_length=128)
    irb_approval_num = models.IntegerField()
    irb_contact = models.CharField(max_length=128)
    contact_email = models.CharField(max_length=128)
    hum_sub_train = models.CharField(max_length=128)
    abstract = HTMLField()

    class Meta:
        db_table = u'protocol'

#Organ related models
class organ(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=128)
    description = models.CharField(max_length=500)

    class Meta:
        db_table = u'organ'


class organ_protocol_link(models.Model):
    #protocolid = models.ForeignKey(protocol, id)
    #organid = models.ForeignKey(organ, id)
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
    telephone = models.CharField(max_length=128)

    class Meta:
        db_table = u'person'

class pi_protocol_link(models.Model):
    #protocolid = models.ForeignKey(protocol, id)
    #personid = models.ForeignKey(person, id)
    protocolid = models.IntegerField()
    personid = models.IntegerField()

    class Meta:
        db_table = u'pi_protocol_link'
        unique_together = (("protocolid", "personid"),)
#Project related models
class project(models.Model):
    title = models.CharField(max_length=128)
    abbreviation = models.CharField(max_length=128)
    sites = models.CharField(max_length=500)
    description = models.CharField(max_length=500)

    class Meta:
        db_table = u'project'

class project_site_link(models.Model):
    projectid = models.IntegerField()
    fundedsiteid = models.IntegerField()

    class Meta:
        db_table = u'project_site_link'
        unique_together = (("projectid", "fundedsiteid"),)

#Institution related models
class institution(models.Model):
    name = models.CharField(max_length=128)
    department = models.CharField(max_length=128)
    abbreviation = models.CharField(max_length=128)
    url = models.CharField(max_length=500)
    description = models.CharField(max_length=500)

    class Meta:
        db_table = u'institution'

#Publication related models
class publication(models.Model):
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
    title = models.CharField(max_length=128)
    pis = models.CharField(max_length=500)
    organs = models.CharField(max_length=500)
    abstract = models.CharField(max_length=500)
    staff = models.CharField(max_length=500)
    description = models.CharField(max_length=500)

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


def new_input_file_id(instance, file_name):

    today = datetime.date.today()
    year = u'%4s' % today.year
    month = u'%02i' % today.month
    day = u'%02i' % today.day

    folder_name = u'%06i' % instance.folder
    return folder_name+'/'+file_name


class InputSeqFile(models.Model):
    seq_file = models.FileField(upload_to=new_input_file_id)
    folder   = models.IntegerField()

