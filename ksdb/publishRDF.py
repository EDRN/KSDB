# publishRDF.py
from django.http import HttpResponse
from django.core.management import call_command
from io import StringIO

#import settings
import logging
import json
logger = logging.getLogger(__name__)

from openpyxl import Workbook
from openpyxl.writer.excel import save_virtual_workbook

def publishrdf(request):
    if request.method == 'GET':
        rdftype = request.GET.get('rdftype')
        filterby = request.GET.get('filterby')
        filterval = request.GET.get('filterval')
        rdf = StringIO()
        call_command('publishrdfs', rdftype, filterby, filterval, stdout=rdf)
        rdf.seek(0)
        rdf_resp = rdf.read()
        rdf_resp = rdf_resp.strip()
        if rdf_resp.startswith("b'"):
            rdf_resp = rdf_resp[2:]
        if rdf_resp.endswith("'"):
            rdf_resp = rdf_resp[:-1]
        rdf_resp = rdf_resp.replace("\\n", "\n")
        return HttpResponse(rdf_resp.strip(), content_type='application/rdf+xml')

def publishexcel(request):
    if request.method == 'GET':
        workbook = Workbook()

        exceltype = request.GET.get('exceltype')
        filterby = request.GET.get('filterby')
        filterval = request.GET.get('filterval')
        all_tabs = ["program", "institution", "fundedsite", "group", "committee", "protocol", "person", "publication", "organ", "species", "specimentype", "discipline", "disease", "degree"]
        if exceltype != "all":
            all_tabs = [exceltype]
        for tab in all_tabs:
            worksheet = workbook.create_sheet(tab)
            excel = StringIO()
            call_command('publishexcel', tab, filterby, filterval, stdout=excel)
            excel.seek(0)
            excel_resp = excel.read()
            excel_resp = excel_resp.strip()
            if excel_resp.startswith("b'"):
                excel_resp = excel_resp[2:]
            if excel_resp.endswith("'"):
                excel_resp = excel_resp[:-1]
            excel_resp = json.loads(excel_resp)
            for row in excel_resp:
                worksheet.append(row)

        response = HttpResponse(content=save_virtual_workbook(workbook), content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
        response['Content-Disposition'] = 'attachment; filename=ksdb.xlsx'
        return response
