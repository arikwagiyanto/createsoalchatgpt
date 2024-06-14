import pprint
import sys
from django.conf import settings

def dd(*args):
    """
    Dump and Die: Print the values of the given arguments and stop execution if in debug mode.
    """
    pp = pprint.PrettyPrinter(indent=4)
    for arg in args:
        pp.pprint(arg)
    
    if settings.DEBUG:
        sys.exit()
