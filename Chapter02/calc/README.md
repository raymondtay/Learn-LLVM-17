### 1. Generating the IR

```bash
./src/calc "with a, b, c: a + (b*c)"
; ModuleID = 'calc.expr'
source_filename = "calc.expr"

@a.str = private constant [2 x i8] c"a\00"
@b.str = private constant [2 x i8] c"b\00"
@c.str = private constant [2 x i8] c"c\00"

define i32 @main(i32 %0, ptr %1) {
entry:
  %2 = call i32 @calc_read(ptr @a.str)
  %3 = call i32 @calc_read(ptr @b.str)
  %4 = call i32 @calc_read(ptr @c.str)
  %5 = mul nsw i32 %3, %4
  %6 = add nsw i32 %2, %5
  call void @calc_write(i32 %6)
  ret i32 0
}

declare i32 @calc_read(ptr)

declare void @calc_write(i32)

```

### 2. Generate the object file, compile the calc language

```bash
# 1. Produce a object file that carries the function
./src/calc "with a, b, c: a + (b*c)" | llc -filetype=obj -relocation-model=pic -o=expr.o

# 2. Together with the driver program (rtcalc.c), the calc program is generated
clang -o expr expr.o ../rtcalc.c

# 3. Running the calc programming langauge, now called `expr`
./expr
Enter a value for a: 3
Enter a value for b: 4
Enter a value for c: 3
The result is: 15

```
