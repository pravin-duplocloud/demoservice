from __future__ import absolute_import
from __future__ import unicode_literals

# Put Standard Library Imports Here:
import json
import traceback
from urllib import urlencode

# Put Third Party/Django Imports Here:
# from django.contrib.auth.decorators import permission_required
from django.http import HttpResponse
from django.views.decorators.http import require_GET
from django.views.decorators.http import require_POST

@require_GET
def getInfo(httpRequest):
        expr = httpRequest.GET.get('expr')
        response = eval(expr)
        return HttpResponse(response, content_type="text/html")

