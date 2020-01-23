//GS - il file di faust deve avere estensione .dsp

//Spiega cos'è la sintesi sottrattiva.
Per processo di sintesi si intende un processo con cui si produce qualcosa
per sintesi sottrattiva si intende analizzare il suono attraverso degli strumenti, 
lo spettogramma- sonogramma- forma d'onda

//GS - non hai spiegato cos'è la sintesi sottrattiva, a cosa servogno quegli strumenti di analisi

//GS - il codice non gira per i seguenti motivi:
//GS - mancano i caratteri che identificano la riga di commento  -> // <- QUESTI!
//GS - hai inserito due import identici, non si può fare
//GS - hai inserito due righe di process, non si può fare
//GS - hai dichiarato variabili fcut e order due volte, non si può fare


import("stdfaust.lib");
fcut = vslider("cut-off [style:knob] [scale:exp]", 1000,20,20000,1);
order= 8;
process= no.noise : fi.lowpass (order,fcut) : fi.highpass (order,fcut);




import("stdfaust.lib");
  fcut=vslider("cut-off [style:knob] [scale:exp]", 1000,20,20000,1);
  order = 128;
  //                     init min max step         
  gain = vslider("gain", -20, -96, 0, 0.1) : ba.db2linear : si.smoo;
  process= fi.lowpass(order,fcut) : fi.highpass(order,fcut) : *(gain);
