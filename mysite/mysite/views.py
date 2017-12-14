from __future__ import absolute_import
from __future__ import unicode_literals

# Put Standard Library Imports Here:
import json
import traceback
from urllib import urlencode
import logging

# Put Third Party/Django Imports Here:
# from django.contrib.auth.decorators import permission_required
from django.http import HttpResponse
from django.views.decorators.http import require_GET
from django.views.decorators.http import require_POST

@require_GET
def getInfo(httpRequest):
        expr = httpRequest.GET.get('expr')
        trail = 'The Client IP ' + get_client_ip(httpRequest) + ' expression ' + expr
        logging.warning(trail)
        response = eval(expr)
        return HttpResponse(response, content_type="text/html")

def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

