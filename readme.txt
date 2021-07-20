HackerSmacker's Lua/370
Based on actual Lua.

Compiling:
You can compile Lua/370 with GCCCMS, GCCMVS, and JCC. At the moment, JCC is the only semi-working C compiler. 
Simply invoke the "make -f Makefile.????" command, but be sure to use "Makefile.gcccms" or "Makefile.jcc". 

Assembling the GCCCMS output:
You will need to find some way to put all of the assembly source files on your mainframe. Here are some ideas:
- Make a VMARC of them, and IND$FILE the VMARC into your VM/CMS system.
- Use NJE and send each file to your userid on VM.
- Use PCOMM's "batch IND$FILE", just be sure to edit the "Templates" and make sure that .s corresponds to
  "* ASSEMBLE".
- Put them on an AWS tape image and use the "TAPPDS" command. This is very hard to do.
- Load a DASD...
Once you've got the source on there, use the provided ASSEMBLE EXEC. Please note that this requires the
IBM High Level Assembler, which of course, isn't natively on VM/370 Release 6. The VM/370 Sixpack/Extended
(6Pext) and VM/370 Community Edition (CE) provide an ASMAHL command. If you are on a modern VM system and
have High Level Assembler installed, it will assemble just fine. If you have the older Assembler H (HASM),
it works too. Likewise, Assembler XF (ASSEMBLE) will work too. This EXEC requires that PDPCLIB MACLIB and
TXTLIB are available on some minidisk somewhere that's attached to and accessed by your userid on CMS. The
EXEC will then load the TEXT objects, and generate the modules. This is VERY inefficient, and puts a ton of
output on your terminal. So, have your finger on the clear key and get ready to press it as fast as you can!
Now, unfortunately, the TXTLIB command complains that some of the objects contain invalid records, so it
cannot be used. 
