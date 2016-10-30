import requests

MACIG_URL = 'http://169.254.169.254/latest/meta-data/security-groups'

def environment():
    try:
        resp = requests.get(MACIG_URL)
        return {'environment': resp.content.split('-')[0]}
    except:
        pass
