module muxSim;

logic a, b, sel, n_sel, f1, f2, f;

	and #2 g1 (f1, a, n_sel),
		   g2 (f2, b, sel);
	or #2  g3 (f, f1, f2);
	not	   g4 (n_sel, sel);
	
	initial begin
        $dumpfile("muxSim.vcd");
        $dumpvars(0, muxSim);	//0 to test of module
	
		$monitor($time,
			"a=%b b=%b sel=%b n_sel=%b f1=%b f2=%b f=%b",
			a, b, sel, n_sel, f1, f2, f);
			a = 0;
			b = 0;
			sel = 0;
			#12 a = 1;
			#6 $finish;
	end
endmodule: muxSim