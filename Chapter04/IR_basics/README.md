### Learning about the load-store approach

All local optimizations in LLVM are based on the SSA form. For global variables,
memory references are used. The IR language shows load and store instructions,
which are used to fetch and store those values. You can use this for local variables too.
These instructions do not belong to the SSA form, and LLVM knows how to convert them
into the required SSA form. Therefore, you can allocate memory slots for each
local variable and use load and store instructions to change their value.
