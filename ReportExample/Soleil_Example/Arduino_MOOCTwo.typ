#import "../../template.typ": *

#show: project.with(
  theme: "lab",
  language: "cn",
  cover: true,
  author: "Soleil",
  school_id: "323010xxxx",
  course: "电子电路设计实验II",
  college: "信息与电子工程学院",
  date: "2025年4月6日",
  teacher: "施红军、叶险峰、邓婧婧",
  major: "微电子科学与工程",
  page_header: true
)

#show: zebraw.with(
  ..zebraw-themes.zebra,
  hanging-indent: true,
  indentation:4,
  numbering-separator:false,
  )
// 绑定边距背景示例
#set page(background: binding_line_background())

#ISEE_Header(ProjName: "Arduino基本实验", type: "设计型实验", groupmate: "my Partner", place: "东四216")
// #set par(first-line-indent: (amount: 2em, all: true))




= 实验一 四位七段显示器实例

== 实验目的
#indent 本实验旨在通过Arduino控制七段数码管的显示，理解数码管的工作原理，掌握控制七段数码管的基本方法和程序设计，进一步熟悉Arduino的编程和硬件操作，增强实践动手能力和编程能力。

#summary(name: "Name")[
- 掌握 Arduino 与 4 位共阴（或共阳）七段数码管的基本接线与编程方法。  
- 学习多位数码管动态扫描（多路复用）显示原理。  
- 熟悉 Arduino 开发环境及基本数字 IO 控制，为后续更复杂的外设实验打下基础。
]

== 实验原理

#indent 七段数码管由7个发光二极管(a,b,c,d,e,f,g) 以及1个点阵(dp)组成，通过不同的组合点亮这些LED，从而显示出不同的数字或字符。其原理是通过控制每个段的高低电平来控制数码管的显示内容。每一个七段数码管都可以显示0到9的数字，以及一些字母和符号。

#note(name: "显示原理")[
  #v(0.14cm)
  在共阴数码管中，各数码管的公共端接 GND，控制段的 Arduino 数字 IO 输出 HIGH 时点亮对应的段；同时，将某一位的位选引脚置 HIGH 以激活该位。  
多位数码管采用动态扫描技术，依次选通各位并设置对应段电平，利用人眼视觉暂留效应形成稳定显示。
]


== 实验器材

- Arduino开发板（Arduino UNO）
- 4 位共阴型七段数码管显示器
- 电阻若干
- 跳线若干
- 面包板
- 四个NPN型三极管

== 实验步骤

=== *电路连接* <4.1>
本实验采用共阴数码管，其接线方式如下：  
#set enum(numbering: "(I)")
+ *段引脚（a、b、c、d、e、f、g）*\ 将数码管的 7 个段依次经 220 Ω 限流电阻后接至 Arduino 的数字 IO 口 2 至 8,即 a、b、c、d、e、f、g 分别接至 Arduino 引脚 2、3、4、5、6、7、8。  
+ *位选引脚（DIG1、DIG2、DIG3、DIG4）*  \ 将数码管的 4 个位选引脚分别直接接至 Arduino 的数字 IO 口 9、10、11、12。激活某位时，Arduino 将该引脚输出 HIGH，从而选通对应的位。  
+ *共阴端与供电*  \ 数码管的共阴端接至 Arduino 的 GND；Arduino 通过 USB 或外部 5V 电源供电，其 GND 须与数码管共地。

=== 硬件搭建
- 按照@4.1 的方法进行接线，将 4 位数码管插于面包板上。  
- 将数码管的段引脚（a～g）通过 220 Ω 电阻后接至 Arduino 数字 IO 口 2 至 8。  
- 将数码管的 4 个位选引脚分别接至 Arduino 数字 IO 口 9 至 12。  
- 数码管共阴端接至 Arduino 的 GND，确保供电正常。
=== 代码编写
课件中提供的代码如下:
```cpp
void setup() 
{
    for (int PIN = 2; PIN < 13; PIN++) 
    {
        pinMode(PIN, OUTPUT);
        digitalWrite(PIN, LOW);
    }
}

void loop() 
{
    // Set all pins to LOW and then turn on specific pins in each iteration
    for (int PIN = 2; PIN < 13; PIN++) 
    {
        digitalWrite(PIN, LOW);
    }
    digitalWrite(9, HIGH);
    digitalWrite(3, HIGH);
    digitalWrite(4, HIGH);
    delay(2);

    for (int PIN = 2; PIN < 13; PIN++) 
    {
        digitalWrite(PIN, LOW);
    }
    digitalWrite(10, HIGH);
    digitalWrite(2, HIGH);
    digitalWrite(3, HIGH);
    digitalWrite(5, HIGH);
    digitalWrite(6, HIGH);
    digitalWrite(8, HIGH);
    delay(2);

    for (int PIN = 2; PIN < 13; PIN++) 
    {
        digitalWrite(PIN, LOW);
    }
    digitalWrite(11, HIGH);
    digitalWrite(2, HIGH);
    digitalWrite(3, HIGH);
    digitalWrite(4, HIGH);
    digitalWrite(5, HIGH);
    digitalWrite(8, HIGH);
    delay(2);

    for (int PIN = 2; PIN < 13; PIN++) 
    {
        digitalWrite(PIN, LOW);
    }
    digitalWrite(12, HIGH);
    digitalWrite(3, HIGH);
    digitalWrite(4, HIGH);
    digitalWrite(7, HIGH);
    digitalWrite(8, HIGH);
    delay(2);
}
```
*为了程序语言的简洁性和可读性,便于`debug`,将代码改成如下格式并增加注释,使之更易读*
```cpp
void clearAllPins();

void setup() {
    // 设置引脚 2 到 12 为输出模式，并初始化为 LOW
    for (int pin = 2; pin <= 12; pin++) {
        pinMode(pin, OUTPUT);
        digitalWrite(pin, LOW);
    }
}

void loop() {
    // 设定一个包含不同引脚组合的二维数组
    int patterns[][6] = {
        {9, 3, 4},           // 第一组引脚组合
        {10, 2, 3, 5, 6, 8}, // 第二组引脚组合
        {11, 2, 3, 4, 5, 8}, // 第三组引脚组合
        {12, 3, 4, 7, 8}     // 第四组引脚组合
    };

    // 遍历每一组引脚组合，点亮相应的引脚并延时
    for (int i = 0; i < 4; i++) {
        clearAllPins(); // 先将所有引脚设置为 LOW

        // 点亮当前组的引脚
        for (int j = 0; j < sizeof(patterns[i]) / sizeof(patterns[i][0]); j++) {
            digitalWrite(patterns[i][j], HIGH);
        }

        delay(2); // 延时
    }
}

// 将所有引脚设置为 LOW
void clearAllPins() {
    for (int pin = 2; pin <= 12; pin++) {
        digitalWrite(pin, LOW);
    }
}
```




=== 烧录代码

将硬件设备连接好之后,使用`USBA to USB TypeC`数据线将电脑与Arduino单片机相连接,实施烧录

*ArduinoIDE截图*如@figure1 所示

#figure(image("pics/image.png"),caption: "成功烧录")<figure1>

=== 实验结果
*观察数码管的显示效果,可以看到数码管依次显示了 4、3、2、1 四个数字。*

#figurex(image("pics/47d54f6e10c05acdb02115d5d9c0480.jpg",width: 70%),"数码管显示效果")



= 实验二 超声波测距
== 实验目的

#indent 本实验旨在通过Arduino控制超声波传感器的测距功能，理解超声波测距的工作原理，掌握控制超声波传感器的基本方法和程序设计，进一步熟悉Arduino的编程和硬件操作，增强实践动手能力和编程能力。

== 实验原理
=== 超声波测距原理
#indent 人耳能听到的声波频率为 20Hz～20 kHz，通常把频率高于 20 kHz的声波称为超声波。超声波具有绕射小、方向性好、易于获得较集中声能、传播时能量消耗缓慢等优点，在测距、测速等方面有广泛应用。

#indent 超声波测距方法有多种，如时间渡越法、相位检测法、声波幅值检测法等。声波幅值检测法易受反射波的影响，有时测量误差较大。相位检测法虽然测量精度较高，但实现相对复杂。与上述两种方法相比，时间渡越法工作原理最为简单，软硬件易于实现。本实验中超声波测距采用的就是时间渡越法。

#indent 时间渡越法是利用超声波在空气中传播的时间来计算距离。超声波传感器发射一个超声波脉冲，然后测量这个脉冲从传感器到达物体并反射回来的时间。根据声速和时间，可以计算出物体与传感器之间的距离。
#note(name: "时间渡越法原理")[
  #v(0.14cm)
  超声波在空气中的传播速度约为340米/秒。根据公式：距离 = 声速 × 时间 / 2，可以计算出物体与传感器之间的距离。
  $ s = (v t) /2 $
  式中，v为超声波在空气中的传播速度、常取为 340m/s，t 为系统测得的超声波发射至接收到反射波的时间差。
  ]
    
=== HC-SR04 超声波模块的电性参数

HC-SR04 超声波测距模块的电性参数如下：

- 工作电压：DC 5V
- 工作电流：15mA
- 静态电流：< 2mA
- 超声波频率：40kHz
- 探测距离：2cm ~ 400cm
- 探测精度：0.3cm ~ 1%
- 感应角度：< 15°

这些电性参数对于实际应用中的测距范围、精度以及功耗等方面起到了关键作用，确保了 HC-SR04 模块在不同环境下的可靠性和稳定性。

=== 代码实现原理

```cpp
/* Measures the length (in microseconds) of a pulse on the pin; state is HIGH
 * or LOW, the type of pulse to measure.  Works on pulses from 2-3 microseconds
 * to 3 minutes in length, but must be called at least a few dozen microseconds
 * before the start of the pulse.
 *
 * This function performs better with short pulses in noInterrupt() context
 */
unsigned long pulseIn(uint8_t pin, uint8_t state, unsigned long timeout)
{
	// cache the port and bit of the pin in order to speed up the
	// pulse width measuring loop and achieve finer resolution.  calling
	// digitalRead() instead yields much coarser resolution.
	uint8_t bit = digitalPinToBitMask(pin);
	uint8_t port = digitalPinToPort(pin);
	uint8_t stateMask = (state ? bit : 0);

	// convert the timeout from microseconds to a number of times through
	// the initial loop; it takes approximately 16 clock cycles per iteration
	unsigned long maxloops = microsecondsToClockCycles(timeout)/16;

	unsigned long width = countPulseASM(portInputRegister(port), bit, stateMask, maxloops);

	// prevent clockCyclesToMicroseconds to return bogus values if countPulseASM timed out
	if (width)
		return clockCyclesToMicroseconds(width * 16 + 16);
	else
		return 0;
	}
    ```

pulseIn函数用于测量引脚上脉冲的宽度，参数包括引脚号、脉冲状态（高或低）和超时值。函数通过缓存引脚的端口和位来加速脉冲宽度测量循环，并使用 countPulseASM 函数来计算脉冲宽度。最后，将宽度转换为微秒并返回。

== 实验器材

- HC-SR04 超声波模块
- Arduino UNO开发板
- 杜邦线若干
- 数据线
- 面包板


== 实验步骤

#summary[
    #set enum(numbering: "(1)")
1. 连接电路：将 HC-SR04 模块与 Arduino 开发板连接，确保各个引脚正确连接。
2. 配置 Arduino 编程环境：打开 Arduino IDE，选择正确的端口和开发板类型。
3. 编写程序：使用 Arduino 语言编写程序，控制 HC-SR04 模块进行超声波发射和接收。
4. 测量距离：通过 Arduino 获取从传感器返回的超声波信号，并根据时间计算物体与传感器的距离。
5. 显示结果：将测量到的距离值通过串口监视器显示出来。
]

=== 电路连接

- 将 HC-SR04 模块的 VCC 引脚连接到 Arduino 的 5V 引脚。
- 将 HC-SR04 模块的 GND 引脚连接到 Arduino 的 GND 引脚。
- 将 HC-SR04 模块的 TRIG 引脚连接到 Arduino 的数字引脚 2。
- 将 HC-SR04 模块的 ECHO 引脚连接到 Arduino 的数字引脚 3。

=== 代码编写

```cpp
int TrigPin = 2;
int EchoPin = 3;
float cm;

void setup() {
    Serial.begin(9600);
    pinMode(TrigPin, OUTPUT);
    pinMode(EchoPin, INPUT);
}

void loop() {
    // 向 TRIG 引脚发送高电平信号
    digitalWrite(TrigPin, LOW);
    delayMicroseconds(2);
    digitalWrite(TrigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(TrigPin, LOW);

    // 从 ECHO 引脚读取回传时间
    cm = pulseIn(EchoPin, HIGH) * 0.034 / 2;
    
    // 显示测量结果
    Serial.print("Distance: ");
    Serial.print(cm);
    Serial.println(" cm");
    delay(1000);
```

=== 烧录代码
将硬件设备连接好之后,使用`USBA to USB TypeC`数据线将电脑与Arduino单片机相连接,实施烧录
#figurex(image("pics/image-1.png",width: 80%),"成功烧录")

== 实验结果
*观察串口监视器的显示效果,可以看到超声波测距模块测量到的距离值。*

#figurex(
    grid(
        columns: 1, gutter: 1pt,
        figure(numbering: none, image("pics/image-2.png",width: 90%), caption: [串口监视器]),
        figure(numbering: none, image("pics/4b936e7dbed23a48d744f98dc380eb7.jpg",width: 33%), caption: [实物图]),
        v(0.1cm)
    ),"示例1")
#figurex(
    grid(
        columns: 1, gutter: 1pt,
        figure(numbering: none, image("pics/image-3.png",width: 100%), caption: [串口监视器]),
        figure(numbering: none, image("pics/1b24ac81a5867e5f11a5bfc6874c73c.jpg",width: 38%), caption: [实物图]),
        v(0.1cm)
    ),"示例2")
示例一和示例二为不同距离下的测量结果，显示了超声波测距模块的工作原理和实际应用效果。
#figurex(image("pics/2b66cc6fc35e0a169d8b1446a51e8d6.jpg",width: 40%),"示例3")
对于示例一和示例三，区别在于示例三使用了一个海绵反射面板，显示了超声波测距模块在不同反射面下的测量效果，结果显示，超声波测距模块在不同材料和形状的反射面下仍然基本能够保持原精度。

= 实验三 LCD1602 显示器实例
== 实验目的
#indent 本实验旨在通过Arduino控制LCD1602显示器的显示，理解LCD1602的工作原理，掌握控制LCD1602的基本方法和程序设计，进一步熟悉Arduino的编程和硬件操作，增强实践动手能力和编程能力。

== 实验原理

#indent LCD1602 是一种常见的字符型液晶显示模块，能够显示 2 行，每行 16 个字符。其工作原理是通过控制模块的引脚，向其发送指令和数据，从而实现字符的显示。

#note(name: "LCD1602 引脚定义")[  
    - VSS：接地  
    - VDD：电源正极（5V）  
    - VO：对比度调节端  
    - RS：寄存器选择端  
    - RW：读写选择端  
    - E：使能端  
    - D0-D7：数据引脚  
    - A：背光正极  
    - K：背光负极  
]

#indent LCD1602 的工作模式分为 4 位模式和 8 位模式。本实验采用 4 位模式，通过 Arduino 控制 LCD1602 显示字符。通过向 RS 和 E 引脚发送控制信号，可以实现对 LCD1602 的初始化、指令发送和数据写入。

#note(name: "LCD1602 初始化步骤")[  
    1. 设置引脚模式，将 RS、E 和 D4-D7 设置为输出。  
    2. 按照 LCD1602 的初始化时序，发送初始化指令。  
    3. 设置显示模式，如显示开关、光标开关等。  
    4. 清屏并设置光标位置。  
]

== 实验器材

- Arduino UNO 开发板  
- LCD1602 显示模块  
- 电位器（用于调节对比度）  
- 面包板  
- 跳线若干  

== 实验步骤

=== *电路连接* <3.1>
按照以下步骤连接 LCD1602 与 Arduino：  
#set enum(numbering: "(I)")
+ *电源连接* \ 将 LCD1602 的 VSS 接 Arduino 的 GND，VDD 接 Arduino 的 5V。  
+ *对比度调节* \ 将 VO 引脚通过电位器连接到 Arduino 的 5V 和 GND，用于调节显示对比度。  
+ *控制引脚* \ 将 RS 和 E 分别连接到 Arduino 的数字引脚 12和11脚， RW直接接地。  
+ *数据引脚* \ 将 D4-D7 分别连接到 Arduino 的数字引脚 5、4、3、2。  
+ *背光连接* \ 将 A 通过一个上拉电阻接入到Arduino 的 5V，K 接地。  

=== 硬件搭建
- 按照@3.1 的方法连接 LCD1602 与 Arduino。  
- 调节电位器，确保 LCD1602 显示清晰。  

=== 代码编写

```cpp
#include <LiquidCrystal.h>

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  lcd.begin(16, 2);  // 初始化 LCD 显示
  Serial.begin(9600);  // 初始化串口通讯
}

void loop() {
  // 检查是否有数据从串口发送到 Arduino
  if (Serial.available()) {
        lcd.clear();
    }


    // 不断读取串口缓冲区中的数据并显示到 LCD
    while (Serial.available()) {
      lcd.write(Serial.read());  // 读取一个字节并显示
      Serial.print(Serial.read());
    }
  }
}
```
#hint[
    #indent 在测试上述代码时，发现一次只能输入一个字符。当输入多个字符时，会出现数据丢失的现象。原因在于 while 循环中，一旦检测到 Serial.available() 为 false，就会跳出循环。而串口在发送一个字符串时，会分批次将数据传输到 Arduino（经测试验证）。这导致了数据丢失的问题。

    #indent 为了解决这一问题，可以在 while 循环中加入 delay(10)，延时 10 毫秒，为串口发送数据预留时间。经过测试，效果显著。同时，采用字符串缓冲的方式进行接收，并加入长度判断，以便当字符串长度过长时，能够自动换行显示到下一行。

    #indent 此外，我还进行了使用自定义字模显示的实验，效果非常理想。

    以下是修改后的代码：
]
*代码优化：*
#mycode(read("src/Arduino.txt"), lang: "cpp",border: false);

=== 烧录代码
将硬件设备连接好之后，使用`USBA to USB TypeC`数据线将电脑与 Arduino 单片机相连接，编译并烧录代码。

#figurex(image("pics/image-4.png"), "编译并烧录代码")

== 实验结果
*观察 LCD1602 的显示效果，可以看到显示屏最初上电初始化显示 汉字“沈”，在串口输入数据之后显示姓名拼音和学号：*
#figurex(grid(
            columns: 2, gutter: 0pt,
            figure(numbering: none, image("pics/07d36f2ca8d87320c7f3c8007e7cd5c.jpg",width: 70%), caption: [串口监视器]),
            figure(numbering: none, image("pics/41d917c99be48f379e598f26f01a326.jpg",width: 70%), caption: [LCD1602 显示器]),
            v(0.1cm)
),"实验结果")







= 总结
通过三个实验的学习，我们成功掌握了 Arduino 的基本硬件控制与编程方法。

#indent 在实验一中，通过控制 4 位共阴型七段数码管的动态扫描显示，我们熟悉了数码管的接线方法和动态扫描显示原理，并优化了代码的可读性和可维护性，为后续复杂外设实验奠定了基础。\ 

#indent 在实验二中，通过 HC-SR04 超声波模块的测距功能，我们深入理解了时间渡越法原理，掌握了超声波模块的接线与编程方法，验证了其在不同反射面下的高测量精度，增强了对传感器应用的理解与实践能力。\ 
#indent 在实验三中，通过控制 LCD1602 显示器显示字符，我们掌握了其工作原理、初始化步骤和基本控制方法，并通过代码优化解决了串口数据丢失问题，进一步实现了复杂显示功能。三个实验的成功实施，不仅提升了我们的硬件操作与编程能力，也为后续更复杂的项目开发积累了宝贵经验。
