import std.stdio;
import std.conv;

import dasm.code_obj;
import dasm.assembler;
import interpret.interpreter;

int main(string args[])
{
    if(args.length < 2) {
      writeln("expected an input file parameter\n");
      return -1;
    }


    auto f = stdin;
    if(args[1] != "-")
      f = File(args[1], "r");

    CodeObject co;
    try {
      writef("==== Assembling DynAsm ====\n");
      co = assembleFile(f);
    } catch(DynAssemblerException ex) {
      writeln(ex.msg);
      return -1;
    }

    writeln("==== Starting execution ====");
    interpretCode(co);


    return 0;
}
