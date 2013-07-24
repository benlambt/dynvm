module datastruct.stack;

private uint initial_size = 16;

class Stack(T)
{
  T data[];
  uint index; // always points to next available slot

  this(uint size=initial_size)
  {
    data.length = size;
    index = 0;
  }

  bool isEmpty()
  {
    return index == 0;
  }

  T top()
  {
    assert(!isEmpty());
    return data[index-1];
  }

  T pop()
  {
    assert(!isEmpty());
    return data[--index];
  }

  void push(T elt)
  {
    if(data.length == index)
      data.length *= 2;
    data[index++] = elt;
  }
}