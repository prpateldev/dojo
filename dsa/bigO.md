## Some common Big O run times

Here are five Big O run times that you’ll encounter a lot, sorted from
fastest to slowest:
- O(log n), also known as log time. Example: Binary search.
- O(n), also known as linear time. Example: Simple search.
- O(n * log n). Example: A fast sorting algorithm, like quicksort
(coming up in chapter 4).
- O(n2). Example: A slow sorting algorithm, like selection sort
(coming up in chapter 2).
- O(n!). Example: A really slow algorithm, like the traveling
salesperson (coming up next!).

Suppose you’re drawing a grid of 16 boxes again, and you can choose
from 5 different algorithms to do so. If you use the first algorithm, it
will take you O(log n) time to draw the grid. You can do 10 operations

per second. With O(log n) time, it will take you 4 operations to draw a
grid of 16 boxes (log 16 is 4). So it will take you 0.4 seconds to draw
the grid. What if you have to draw 1,024 boxes? It will take you
log 1,024 = 10 operations, or 1 second to draw a grid of 1,024 boxes. These numbers are using the first algorithm.

The second algorithm is slower: it takes O(n) time. It will take 16
operations to draw 16 boxes, and it will take 1,024 operations to draw
1,024 boxes. How much time is that in seconds?

Here’s how long it would take to draw a grid for the rest of the
algorithms, from fastest to slowest:

| No. Of Boxes | O(logn) | O(n)    | O(nlogn) | O(n2)   | O(n!)     |
|--------------|---------|---------|----------|---------|-----------|
| 16           | 0.4sec  | 1.6sec  | 6.4sec   | 25.6sec | 66301year |
| 256          | 0.8sec  | 25.6sec | 3.4min   | 1.8hrs  | in years  |
| 1024         | 1sec    | 1.7min  | 17min    | 1.2days | in years  |


There are other run times, too, but these are the five most common.

This is a simplification. In reality you can’t convert from a Big O run
time to a number of operations this neatly, but this is good enough
for now. We’ll come back to Big O notation in chapter 4, after you’ve
learned a few more algorithms. For now, the main takeaways are as
follows:
- Algorithm speed isn’t measured in seconds, but in growth of the
number of operations.
- Instead, we talk about how quickly the run time of an algorithm
increases as the size of the input increases.
- Run time of algorithms is expressed in Big O notation.
- O(log n) is faster than O(n), but it gets a lot faster as the list of items
you’re searching grows.
