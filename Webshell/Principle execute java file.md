# Compilation and Execution of a Java Program
it involves a two-step execution, first through an OS-independent compiler; and second, in a virtual machine (JVM) which is custom-built for every operating system. 

The two principal stages are explained below:
## Principle 1: Compilation
First, the source ‘.java’ file is passed through the compiler, which then encodes the source code into a machine-independent encoding, known as Bytecode. The last step of this process is generate a .class files
## Principle 2: Execution
To run, the main class file (the class that contains the method main) is passed to the JVM[1] and then goes through three main stages before the final machine code is executed. These stages are:
These states do include:

* ClassLoader
* Bytecode Verifier
* Just-In-Time Compiler
### ClassLoader
The main class is loaded into the memory bypassing its ‘.class’ file to the JVM, through invoking the latter. All the other classes referenced in the program are loaded through the class loader.
```
// loadClass function prototype

Class r = loadClass(String className, boolean resolveIt);

// className: name of the class to be loaded
// resolveIt: flag to decide whether any referenced class should be loaded or not.
```
There are two types of class loaders

* primordial
* non-primordial
### Bytecode Verifier
After the bytecode of a class is loaded by the class loader, it has to be inspected by the bytecode verifier, whose job is to check that the instructions don’t perform damaging actions.
### Just-In-Time Compiler
This is the final stage encountered by the java program, and its job is to convert the loaded bytecode into machine code.

![image](https://github.com/user-attachments/assets/2a06d8f1-7979-4ab6-8a45-012279a8b344)






--------------------------------------------------------------------
* [1] The Java Virtual Machine (JVM) is the core component of the Java platform. It acts as an abstract computing machine that enables a computer to run Java programs, as well as programs written in other languages compiled to Java bytecode (e.g., Kotlin, Scala).



