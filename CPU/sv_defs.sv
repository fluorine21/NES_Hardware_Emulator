
package sv_defs;

function automatic void load_raw_listing(ref integer listing[], string filename);

	
	$readmemh(filename, listing);


endfunction

endpackage