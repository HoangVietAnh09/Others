# What is android's SMALI code?
When you create an application code, the apk file contains a .dex file, which contains binary Dalvik bytecode. Smali is an assembly language that runs on Dalvik VM, which is Android's JVM.

![image](https://github.com/user-attachments/assets/24430a98-49c9-4285-a2ab-82b6b42deb3c)

![image](https://github.com/user-attachments/assets/db941fc7-69e8-472f-b1d0-fa81305ff4f9)

# Smali Syntax – Types
![Screenshot_3](https://github.com/user-attachments/assets/61988b71-dc53-48d6-9e63-7821d2ef8a70)

# Specifying the number of registers in a method
* he .registers directive specifies the total number of registers in the method
* the alternate .locals directive specifies the number of non-parameter registers in the method

![image](https://github.com/user-attachments/assets/78b2a72b-1a36-4054-96ad-3bb624209f9e)

# How method parameters are passed into a method
If a method has 2 arguments, and 5 registers (v0-v4), the arguments would be placed into the last 2 registers - v3 and v4.

Let's say you specify that there are 5 registers in the method (v0-v4), with either the .registers 5 directive or the .locals 2 directive (i.e. 2 local registers + 3 parameter registers). When the method is invoked, the object that the method is being invoked on (i.e. the this reference) will be in v2, the first integer parameter will be in v3, and the second integer parameter will be in v4.

# Register names
There are two naming schemes (parameter register) 
*  the normal v naming scheme (local register)
*  the p naming scheme for parameter registers. (not for param)

=> .registers N Define the total number of registers (v + p) used in the function, not separated.

The first register in the p naming scheme is the first parameter register in the method.
![image](https://github.com/user-attachments/assets/3df100f5-bb12-4c58-bc7c-b57f9d920c0d)

# Motivation for introducing parameter registers
Keep in mind that the method parameters are stored in the last registers in the method. If you increase the number of registers - you change which registers the method arguments get put into. So you would have to change the .registers directive and renumber every parameter register.

But if the p naming scheme was used to reference parameter registers throughout the method, you can easily change the number of registers in the method, without having to worry about renumbering any existing registers.
# Long/Double values
long and double primitives (J and D respectively) are 64 bit values, and require 2 registers.

# Application Structure. (APK)
![image](https://github.com/user-attachments/assets/798b9f37-9caf-4735-a633-baae6d2ecbe6)

* AndroidManifest.xml: the manifest file in binary XML format.
* classes.dex: application code compiled in the dex format.
* resources.arsc: file containing precompiled application resources, in binary XML.
* res/: folder containing resources not compiled into resources.arsc
* assets/: optional folder containing applications assets, which can be retrieved by AssetManager.
* lib/: optional folder containing compiled code - i.e. native code libraries.
* META-INF/: folder containing the MANIFEST.MF file, which stores meta data about the contents of the JAR. which sometimes will be store in a folder named original.The signature of the APK is also stored in this folder.
* Every APK file includes an AndroidManifest.xml file which declares the application’s package name, version components and other metadata. Full detail of Android manifest specs file can be view here.
* 
