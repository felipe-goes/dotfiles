# What is CPU Load in the context of embedded software development?

CPU load, in the context of embedded software development, refers to the
percentage of time the CPU is actively working on executing tasks versus being
idle, within a given time frame. Understanding CPU load is crucial for
optimizing system performance, ensuring efficient resource utilization, and
maintaining the responsiveness of the application.

Here are some key points about CPU load:

## Measurement

- **Idle Task**: Embedded systems often include an idle task that runs when
  no other tasks need to be executed. CPU load can be inferred by measuring the
  time spent in the idle task compared to the total time.
- **Cycle Counters**: Many modern microcontrollers and processors include
  cycle counters or performance monitoring units that can help measure CPU load.
- **Software Tools**: Real-time operating systems (RTOS) often provide
  built-in mechanisms or software tools (e.g., FreeRTOS, Micrium µC/OS) to
  measure CPU load.

## Causes of High CPU Load

- **Excessive Interrupts**: Frequent or poorly managed interrupts can
  increase CPU load.
- **Inefficient Code**: Suboptimal algorithms or busy-wait loops can lead to
  high CPU utilization.
- **High Task Frequency**: Tasks that execute too frequently or have long
  execution times can contribute to high CPU load.

## Impact

- **Real-time Performance**: High CPU load can affect the timing and
  responsiveness of real-time tasks, leading to missed deadlines or system
  instability.
- **System Stability**: Overloading the CPU can cause tasks to be starved of
  CPU time, leading to system crashes or erratic behavior.
- **Power Consumption**: Higher CPU load generally leads to increased power
  consumption, which is a critical factor in battery-operated or
  energy-sensitive applications.

## Management

- **Task Prioritization**: Using an RTOS to prioritize tasks and manage CPU
  time efficiently.
- **Optimizing Code**: Profiling and optimizing your code to reduce
  unnecessary CPU usage.
- **Load Balancing**: Distributing tasks more evenly or offloading some tasks
  to hardware accelerators (if available).
- **Sleep Modes**: Utilizing sleep or power-saving modes when the CPU is idle
  to conserve power.

## Example Calculation

If you have a system where the total time measured is 100ms, and within that
period, the CPU spends 30ms executing the idle task, the CPU load can be
calculated as:

```latex
\[
\text{CPU Load} (\%) = \left( \frac{\text{Total Time} - \text{Idle Time}}{\text{Total Time}} \right) \times 100
\]
Applying the numbers:
\[
\text{CPU Load} (\%) = \left( \frac{100ms - 30ms}{100ms} \right) \times 100 = 70\%
\]
```

![CPU Load](./imgs/embedded/embedded-latex-1.png 'CPU Load calculation example')

Managing CPU load effectively is vital for maintaining the performance and
reliability of embedded systems.

# Is it possible to measure CPU Load only with the code and the compiler? If so, how can you do it?

Yes, it is possible to measure CPU load using only your code and compiler,
without relying on external tools or hardware performance counters. This
typically involves instrumenting your code to track active and idle times.
Here's a basic approach to achieve this in an embedded system:

## Measuring CPU Load with Code

- **Define Idle and Active States**
  - **Idle Task**: Implement a low-priority idle task that runs when no other
    tasks are active.
  - **Timestamping**: Use a timer to measure the time spent in both active and
    idle states.
- **Setup a Timer**
  - Initialize a timer to keep track of the system time. Ideally, this timer
    should have high granularity.

## Example Implementation in C:

### 1. Timer Setup

```c
#include <stdint.h>

// Assume an example function to get the current timer count
extern uint32_t get_timer_count();

// Variables to store the counts
volatile uint32_t active_time = 0;
volatile uint32_t idle_time = 0;
volatile uint32_t last_timestamp = 0;

// Function to initialize the timer
void init_timer() {
    // Initialize timer hardware and set `last_timestamp`
    last_timestamp = get_timer_count();
}
```

### 2. Idle Task

Implement an idle task that updates the idle time periodically:

```c
void idle_task() {
    uint32_t current_time;
    while (1) {
        current_time = get_timer_count();

        // Calculate the time spent since the last timestamp
        idle_time += (current_time - last_timestamp);

        // Update the last timestamp
        last_timestamp = current_time;
    }
}
```

### 3. Task Scheduling

Update the task scheduler to track active time. This will depend on whether
you're using an RTOS or a basic scheduler:

## Example with a Basic Scheduler:

```c
void task_scheduler(void) {
    uint32_t current_time;

    while (1) {
        // Check for tasks and execute them
        if (task_to_run()) {
            current_time = get_timer_count();

            // Calculate the time spent since the last timestamp
            active_time += (current_time - last_timestamp);

            // Run the task
            run_task();

            // Update the last timestamp
            last_timestamp = current_time;
        } else {
            // No task to run, call the idle task
            idle_task();
        }
    }
}
```

### 4. Calculating CPU Load

Periodically calculate the CPU load:

```c
void calculate_cpu_load() {
    uint32_t total_time = active_time + idle_time;

    // Prevent division by zero
    if (total_time == 0) return;

    // Calculate CPU load
    uint32_t cpu_load = (active_time * 100) / total_time;

    // Optionally print or store the CPU load
    printf("CPU Load: %u%%\n", cpu_load);

    // Reset counters
    active_time = 0;
    idle_time = 0;
}
```

## Integration

- **Initialize the Timer**: Call `init_timer()` at the start of your
  application.
- **Periodic Calculation**: Schedule `calculate_cpu_load()` to run
  periodically, such as within a timer interrupt or another low priority task.

## Considerations

- **Granular Timer**: Ensure your timer has fine granularity for accurate load
  measurement.
- **Interrupts**: Take into account the time spent in interrupt service
  routines (ISRs) as they can affect the accuracy.
- **Overhead**: Be mindful of the overhead introduced by your measurement code.
  It should be minimal to avoid skewing the results.

By instrumenting your code in this way, you can measure the CPU load without
needing any special hardware support or external tools, relying entirely on the
code and the compiler environment.

# Which are common tactics to improve cpu load? What do I have to look in the code that needs to be improved in order to have a better cpu load?

Improving CPU load in embedded systems involves a combination of optimizing
code efficiency, managing task scheduling, and ensuring effective use of system
resources. Here are some common tactics to improve CPU load and what you should
look for in the code:

## Tactics to Improve CPU Load

- **Code Optimization**
  - **Algorithm Efficiency**: Choose the most time-efficient algorithms for
    your tasks. For example, replacing an O(n^2) algorithm with an O(n log n)
    algorithm where appropriate.
  - **Reduce Complexity**: Simplify complex expressions and loop structures
    wherever possible.
  - **Optimize Loops**: Minimize the number of operations inside loops and try
    to reduce the number of iterations. Loop unrolling can help but must be used
    judiciously due to increased code size.
  - **Compiler Optimization Flags**: Use compiler optimization flags (e.g.,
    `-O2`, `-O3` for GCC) to allow the compiler to optimize code performance.
- **Efficient Task Scheduling**
  - **Priority Management**: Properly set task priorities to ensure that
    critical tasks are scheduled appropriately and lower priority tasks do not
    starve them.
  - **Task Blocking**: Make use of blocking calls (e.g., semaphores, mutexes,
    condition variables) instead of busy-waiting, which wastes CPU cycles.
  - **Reduce Interrupts**: Minimize the use and execution time of interrupts.
    Use efficient interrupt service routines (ISRs) and, if possible, offload
    processing to main tasks.
- **Resource Utilization**
  - **Memory Access Patterns**: Optimize access patterns to make effective use
    of CPU caches. Avoid access patterns that can lead to cache misses.
  - **DMA Usage**: Use Direct Memory Access (DMA) for data transfer operations
    to offload the CPU.
  - **Peripheral Offloading**: Utilize hardware peripherals for tasks like
    timers, ADCs, communication modules, etc., to reduce CPU load.
- **Code Profiling and Hotspots**
  - **Identify Bottlenecks**: Use profiling tools or custom instrumentation to
    identify functions or code sections that consume the most CPU time.
  - **Inline Functions**: Consider inlining small, frequently called functions,
    but be cautious about code size increase.
- **Energy Management**
  - **Low Power Modes**: Use low-power or sleep modes to reduce CPU load and
    power consumption when the system is idle.
  - **Dynamic Frequency Scaling**: Adjust the CPU clock speed dynamically based
    on the current load (if supported by your hardware).

## What to Look for in the Code

- **Inefficient Algorithms**
  - Look for algorithms with high time complexity and consider more efficient
    alternatives.
  - Example: Replace bubble sort (O(n^2)) with quicksort (O(n log n)).
- **Busy-Wait Loops**
  - Identify busy-wait loops and replace them with event-driven mechanisms.
  - Example: Using a delay function like `while(1) {}` to wait for a condition
    can be replaced with an interrupt-based approach.
- **Long ISR Execution Times**
  - Review your ISRs to ensure they are concise and offload work to main tasks.
  - Example: Move data processing out of the ISR and signal the main task to
    handle it.
- **Frequent Context Switching**
  - Excessive context switching can degrade performance; ensure task priorities
    and frequencies are tuned to minimize unnecessary switching.
  - Example: Tasks that switch too often can be managed with better priority
    settings and sleep mechanisms.
- **Redundant Operations**
  - Look for and eliminate redundant calculations or function calls.
  - Example: Pre-compute values outside loops that do not change within the
    loop.
- **Memory Access Patterns**
  - Ensure memory accesses are efficient and make good use of caching
    mechanisms.
  - Example: Access array elements sequentially to maximize cache hits.

## Example Code Assessments

### Before Optimization:

```c
void process_data() {
    for (int i = 0; i < LARGE_ARRAY_SIZE; i++) {
        for (int j = 0; j < LARGE_ARRAY_SIZE; j++) {
            if (array[i][j] > THRESHOLD) {
                array[i][j] = compute_value(array[i][j]);
            }
        }
    }
}
```

### After Optimization:

```c
void process_data() {
    for (int i = 0; i < LARGE_ARRAY_SIZE; i++) {
        for (int j = 0; j < LARGE_ARRAY_SIZE; j++) {
            int value = array[i][j];
            if (value > THRESHOLD) {
                array[i][j] = precomputed_values[value];
            }
        }
        __builtin_prefetch(&array[i+1][0], 0, 3); // Prefetch next row if applicable
    }
}
```

The optimized version reduces the number of function calls and uses prefetching
to optimize memory access patterns.

By closely examining your code for these issues and applying these optimization
techniques, you can significantly improve CPU load and overall system
performance in your embedded applications.

# Is there a way to improve if and switch statements to improve cpu load? If so how?

Improving the efficiency of `if` and `switch` statements can contribute to
reducing CPU load, particularly in performance-critical sections of embedded
software. Here are several strategies for optimizing these control flow
constructs:

## Optimizing `if` Statements

- **Branch Prediction Optimization**
  - Modern CPUs use branch prediction algorithms to predict the outcome of
    conditional statements. Ensure that conditions that are most likely to be
    true are checked first.
  - Example:
    ```c
    // Assume `condition1` is true most of the time
    if (condition1) {
     // likely code path
    } else {
     // less likely path
    }
    ```
- **Minimize Nested Conditions**

  - Flatten nested `if` statements where possible to reduce complexity and
    improve readability.
  - Example:

    ```c
    // Before optimization
    if (condition1) {
        if (condition2) {
            // Do something
        }
    }

    // After optimization
    if (condition1 && condition2) {
        // Do something
    }
    ```

- **Avoid Redundant Conditions**

  - Remove checks for conditions that are guaranteed by other logic, reducing
    unnecessary evaluations.
  - Example:

    ```c
    // Before optimization
    if (x > 0) {
        if (x > 5) {
            // Do something
        }
    }

    // After optimization
    if (x > 5) {
        // Do something
    }
    ```

- **Use Lookup Tables**

  - For conditions that map to discrete output values, use lookup tables or
    arrays to replace condition checks with direct indexing.
  - Example:

    ```c
    // Before optimization
    if (input == 0) {
        output = 10;
    } else if (input == 1) {
        output = 20;
    } else {
        output = 30;
    }

    // After optimization using a lookup table
    const int lookup_table[] = {10, 20, 30};
    output = lookup_table[input];
    ```

## Optimizing `switch` Statements

- **Use Dense Value Ranges**

  - Ensure the values in the `switch` statement are contiguous or have a small
    range to allow the compiler to use jump tables efficiently.
  - Example:
    ```c
    // Ideal for jump table optimization
    switch (value) {
        case 0:
            // Do something
            break;
        case 1:
            // Do something
            break;
        case 2:
            // Do something
            break;
        default:
            // Default case
            break;
    }
    ```

- **Compile-Time Optimization**

  - Enable compiler optimizations that improve the efficiency of `switch`
    statements. For example, GCC uses `-O2` or `-O3` flags to perform switch
    statement optimizations.
  - Example:
    ```sh
    gcc -O2 -o my_program my_program.c
    ```

- **Minimize Execution in Cases**

  - Ensure minimal processing within each case to reduce overhead.
  - Example:
    ```c
    switch (value) {
        case 0:
            handle_case_0();
            break;
        case 1:
            handle_case_1();
            break;
        // More cases...
    }
    ```

- **Binary Search for Large Sparse Switches**

  - For large and sparse value spaces where switch cases are not contiguous,
    implement binary search manually.
  - Example:

    ```c
    int handle_sparse_switch(int value) {
        static const int keys[] = {2, 5, 7, 10, 15}; // Sorted keys
        static const int (*handlers[])(void) = {handle_2, handle_5, handle_7, handle_10, handle_15};
        int low = 0, high = 4;

        while (low <= high) {
            int mid = (low + high) / 2;
            if (keys[mid] < value)
                low = mid + 1;
            else if (keys[mid] > value)
                high = mid - 1;
            else
                return handlers[mid]();
        }
        return handle_default();
    }
    ```

## Example Combining Techniques

### Before Optimization:

```c
void process_value(int value) {
    if (value == 0) {
        // processing for value 0
    } else if (value == 1) {
        // processing for value 1
    } else if (value == 2) {
        // processing for value 2
    // more conditions...
    } else {
        // default processing
    }
}
```

### After Optimization:

```c
void process_value(int value) {
    static const int lookup_table[] = {10, 20, 30}; // Assuming value maps to these outputs
    if (value >= 0 && value < 3) {
        int output = lookup_table[value];
        // use output
    } else {
        // default processing
    }
}
```

By applying these techniques, you can make your `if` and `switch` statements
more efficient, leading to improved CPU load and overall performance of your
embedded application.

# How moving part of the logic to a function impact the cpu load?

Moving parts of the logic to a function can impact CPU load in both positive
and negative ways, depending on various factors. Here’s an overview of how this
can occur, and what you can consider to make an informed decision:

## Positive Impacts:

- **Code Readability and Maintainability**

  - **Improved Readability**: Breaking down large blocks of code into smaller,
    well-named functions makes the code easier to read and understand.
  - **Maintainability**: Smaller functions facilitate easier debugging,
    testing, and maintenance. This does not directly impact CPU load but helps
    manage complexity.

- **Code Reusability**

  - **Reuse**: If a particular logic is needed in multiple places, defining it
    in a function allows reuse instead of duplication, reducing code size.

- **Inlining by Compiler**
  - **Compiler Inlining**: Modern compilers often inline small functions,
    replacing the function call with the function’s body, eliminating the call
    overhead. Compiler optimization flags like `-O2` or `-O3` can help.
  - **Example**:
    ```c
    static inline int add(int a, int b) {
        return a + b;
    }
    ```
  - The **inline** keyword suggests to the compiler to inline the function,
    reducing call overhead.

## Negative Impacts:

- **Function Call Overhead**

  - **Overhead**: Each function call introduces overhead including stack
    operations (pushing and popping return address, parameters, saved
    registers), instruction pipeline delays, and potential cache misses.
  - **Example**:

    ```c
    void do_something() {
        // Some logic
    }

    void main_task() {
        for (int i = 0; i < 1000; i++) {
            do_something();  // Function call overhead here
        }
    }
    ```

  - In critical loops or performance-sensitive code, this overhead can be
    significant.

- **Potential for Decreased Performance**
  - **Execution Time**: The cumulative effect of function call overhead in
    highly iterative or deeply nested logic could hurt performance.
  - **Inlining Limits**: Inlining is suitable for small functions. Large
    functions may not be inlined due to increased code size and instruction
    cache overflow.

## Trade-offs and Considerations

- **Size/Complexity vs. Frequency**

  - **Frequent Small Functions**: For frequently called small functions,
    inlining or embedding logic can be beneficial.
  - **Complex Functions**: For larger, more complex functions that are not
    called frequently, the overhead is less impactful.

- **Profiling and Optimization**
  - **Identify Hotspots**: Use profiling tools to identify
    performance-critical sections of your code.
  - **SelectiveInlining**: Inline critical small functions manually if needed
    and leave the rest as function calls.
  - **Compiler Flags**: Use compiler flags to guide optimization:
    ```bash
    gcc -O2 -mno-stack-arg-probe -o optimized_binary source.c
    ```

## Example: Optimizing Function Calls

### Before Optimization:

```c
void compute() {
    for (int i = 0; i < 100000; i++) {
        do_work();  // Function call overhead
    }
}

void do_work() {
    // Logic for work that isn't reused elsewhere
    // and is small and performance-critical
}
```

### After Optimization (Manual Inlining Approach):

```c
void compute() {
    for (int i = 0; i < 100000; i++) {
        // Inline the logic from do_work() here if it's small
        // and critical to performance
        // Example inlined logic:
        // int result = some_computation(i);
    }
}

// or mark as inline if appropriate:
inline void do_work() {
    // Inline logic if supported by compiler
}
```

## Practical Tips:

- **Profile Before Refactoring**: Measure before and after changes to ensure
  performance benefits.
- **Maintain Balance**: Keep a balance between code maintainability and
  performance.
- **Understand Your Compiler**: Use compiler documentation to understand
  inlining and optimization behaviors.
- **Use `inline` Wisely**: Annotate only small, frequently called functions to
  suggest inlining.

Optimizing CPU load by moving logic to functions requires careful analysis. The
benefits of code structure and readability should be weighed against the
potential performance cost of function call overhead, making use of profiling
and informed decisions to guide optimization.
