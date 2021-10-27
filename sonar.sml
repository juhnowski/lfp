open Posix.Signal
open MLton
open Itimer Signal Thread

fun beepOff () = print "Beep Off \n"

fun beepOn () = (print "Beep On\n";
     loop 5000)

fun beep () = (Thread.spawn beepOn;
   Thread.spawn beepOff;
   Thread.runAfter (50))

fun period () = (beep ();
     period ())

val _ = (Thread.spawn (period ());
     Thread.runAfter (3000000))
