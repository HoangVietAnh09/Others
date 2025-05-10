subclazz = ''.__class__.__bases__[0].__subclasses__()[:]
for i in range(len(subclazz)):
    if 'warnings' in str(subclazz[i]):
        print(f'[+] INDEX: {i} - SUBCLAZZ: {str(subclazz[i])}')
