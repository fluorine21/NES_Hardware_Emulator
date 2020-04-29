
filename = "vram_listing.sv";

%fid = edit(filename);

fid = fopen(filename, 'wt');
if fid ~= -1
    %Generate the listing
    gen_vram(fid)
    
    fclose(fid);
else
    warningMessage = sprintf('Cannot open file %s', filename);
    uiwait(warndlg(warningMessage));
end


function gen_vram(vram_file)

fprintf(vram_file, "\n\npackage vram_listing;\n\n");

%Payload goes here
%gen_payload_1(vram_file);
gen_payload_2(vram_file);

fprintf(vram_file, "\n\nendpackage\n");

end


function gen_payload_2(vram_file)

%Generate the spram preamble
gen_spram_payload(vram_file);

%Payload preamble
fprintf(vram_file, "integer vram_listing[] = \n{\n\n\n");

%Write one pattern of all FF to both tables
for i = 0 : 15
    write_value(vram_file, i, '00FF',0);
end
for i = hex2dec('1000'):hex2dec('100F')
    write_value(vram_file, i, '00FF',0);
end


%Write the first nametable with all 0 to select tile 0
%Also zero out the attribute table
for i = hex2dec('2000'):hex2dec('23FF')
    
    if(i < hex2dec('23C0'))
        write_value(vram_file, i, 0, 0);
    else
        write_value(vram_file, i, '0000', 0);
    end
    
end

%Color table
for i = hex2dec('3F00'):hex2dec('3F1F')
    
    if(i == hex2dec('3F1F'))
        %Select first tile
        write_value(vram_file, i, (mod(i,32)), 1);
        
    else
        %Select first tile
        write_value(vram_file, i, (mod(i,32)), 0);
        
    end
    
end

%Payload ending
fprintf(vram_file, "\n\n\n};\n");


end

function gen_payload_1(vram_file)

%Generate the spram preamble
gen_spram_payload(vram_file);

%Payload preamble
fprintf(vram_file, "integer vram_listing[] = \n{\n\n\n");


%Both pattern tables will be alternating solid transparent blocks
%2000 hes is
for i = 0 : hex2dec('1FFF')
    
    if(mod(round((i+8)/16), 2))
        write_value(vram_file, i, 'FFFF',0);
    else
        write_value(vram_file, i, 'FFFF',0);
    end
    
end

%nametables0
for i = hex2dec('2000'):hex2dec('23FF')
    
    if(i < hex2dec('23C0'))
        write_value(vram_file, i, 0, 0);
    else
        write_value(vram_file, i, '0000', 0);
    end
    
end

%nametable1
for i = hex2dec('2400'):hex2dec('27FF')
    
    if(i < hex2dec('27C0'))
        write_value(vram_file, i, 1, 0);
    else
        write_value(vram_file, i, '0055', 0);
    end
    
end

%nametables2
for i = hex2dec('2800'):hex2dec('2BFF')
    
    if(i < hex2dec('2BC0'))
        write_value(vram_file, i, 2, 0);
    else
        write_value(vram_file, i, '00AA', 0);
    end
    
    
end

%nametables3
for i = hex2dec('2C00'):hex2dec('2EFF')
    
    if(i < hex2dec('2EC0'))
        write_value(vram_file, i, 3, 0);
    else
        write_value(vram_file, i, '00FF', 0);
    end
    
end

%Color table
for i = hex2dec('3F00'):hex2dec('3F1F')
    
    if(i == hex2dec('3F1F'))
        %Select first tile
        write_value(vram_file, i, (mod(i,32)), 1);
        
    else
        %Select first tile
        write_value(vram_file, i, (mod(i,32)), 0);
        
    end
    
end

%Payload ending
fprintf(vram_file, "\n\n\n};\n");


end

function gen_spram_payload(vram_file)

    spram_file = fopen("spram_listing.v");
    txt = textscan(spram_file,'%s','delimiter','\n');
    result_cell = txt{1};
    
    for i = 1:51
        fprintf(vram_file, "%s\n", result_cell{i});
    end
    fprintf(vram_file, "\n\n\n");

end

function write_value(vram_file, addr, value, isend)

val_new = value;
if(~ischar(value))
    val_new = dec2hex(value, 4);
end
if(isend)
    
    fprintf(vram_file, "16'h%s, 16'h%s\n", dec2hex(addr, 4), val_new);
    
else
    
    fprintf(vram_file, "16'h%s, 16'h%s,\n", dec2hex(addr, 4), val_new);
    
end

end