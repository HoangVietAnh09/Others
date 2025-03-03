# **InvocationHandler trong Java và Mối liên Quan đến XStream Deserialization Attack**  

![proxy](https://github.com/user-attachments/assets/b0a5d0b2-fabb-4085-a5fe-8619a1d713fb)


---

## **🔹 InvocationHandler là gì?**  
`InvocationHandler` là một interface trong Java **dùng để tạo Proxy động (Dynamic Proxy)**. Nó giúp gọi **method của object một cách gián tiếp** bằng cách sử dụng **reflection**.  

***InvocationHanlder chỉ có thể áp dụng với các method của interface.***

### 📌 **Ví dụ về InvocationHandler**  
```java
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

class MyHandler implements InvocationHandler {
    private final Object target;

    public MyHandler(Object target) {
        this.target = target;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("Intercepted method: " + method.getName());
        return method.invoke(target, args);
    }
}

interface Hello {
    void sayHello();
}

class HelloImpl implements Hello {
    public void sayHello() {
        System.out.println("Hello, world!");
    }
}

public class ProxyExample {
    public static void main(String[] args) {
        HelloImpl realObject = new HelloImpl();
        Hello proxyObject = (Hello) Proxy.newProxyInstance(
                HelloImpl.class.getClassLoader(),
                new Class[]{Hello.class},
                new MyHandler(realObject)
        );

        proxyObject.sayHello();
    }
}
```
# **Converter trong java**
Converter trong Java là một mô hình thiết kế giúp chuyển đổi dữ liệu từ kiểu này sang kiểu khác. Nó thường được sử dụng trong các thư viện như XStream, Spring, ModelMapper, v.v., để chuyển đổi dữ liệu giữa các định dạng khác nhau (ví dụ: từ Object sang XML, từ String sang Date, từ DTO sang Entity, v.v.).
## Converter trong XStream (Chuyển đổi Object ↔ XML)
XStream sử dụng Converter để tùy chỉnh cách một đối tượng Java được chuyển đổi thành XML và ngược lại.

```
import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import java.time.LocalDate;

public class LocalDateConverter implements Converter {
    @Override
    public boolean canConvert(Class type) {
        return type.equals(LocalDate.class);
    }

    @Override
    public void marshal(Object source, HierarchicalStreamWriter writer, MarshallingContext context) {
        writer.setValue(source.toString()); // Chuyển LocalDate thành String
    }

    @Override
    public Object unmarshal(HierarchicalStreamReader reader, UnmarshallingContext context) {
        return LocalDate.parse(reader.getValue()); // Chuyển String thành LocalDate
    }
}
```

Cách đăng ký Converter trong XStream:
```
XStream xStream = new XStream();
xStream.registerConverter(new LocalDateConverter());
```


