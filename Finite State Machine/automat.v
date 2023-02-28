module automat(clk, reset, i1, i5, i10, suc, r1, r5, rest);

input clk, reset, i1, i5, i10, rest;
output reg suc, r1, r5;
reg [2:0] s, nexts;

always @(posedge clk, posedge reset)
    begin
        if(reset)
            begin
            s <= 3'b000;
            nexts <= 3'b000;
            suc <= 0; r1 <= 0; r5 <= 0;
            end
        else
            s <= nexts;
    end

always @(s, i1, i5, i10, rest)
begin
    suc = 0; r1 = 0; r5 = 0;
    begin
    case ({s})
        3'b000: // 0 lei in tonomat
        begin
            if (i1 == 1 && i5 == 0 && i10 == 0)
                nexts = 3'b001; // 1 leu in tonomat
            if (i1 == 0 && i5 == 1 && i10 == 0)
                begin
                nexts = 3'b101; // 1 leu rest
                suc = 1;
                r1 = 1;
                end
            if (i1 == 0 && i5 == 0 && i10 == 1)
                begin 
                nexts = 3'b110; // 2 lei rest
                suc = 1;
                r5 = 1;
                end
        end
        3'b001: // 1 leu in tonomat
        begin
            if (rest == 1)
                nexts = 3'b101;
            if (i1 == 1 && i5 == 0 && i10 == 0)
                nexts = 3'b010; // 2 lei in tonomat  
            if (i1 == 0 && i5 == 1 && i10 == 0)
                begin
                nexts = 3'b110; // 2 lei rest
                suc = 1;
                r1 = 1;
                end
            if (i1 == 0 && i5 == 0 && i10 == 1)
                begin
                nexts = 3'b011; // 3 lei rest
                suc = 1;
                r5 = 1;
                end
        end
        3'b010: // 2 lei in tonomat
        begin
            if(rest == 1)
                nexts = 3'b110;
            if (i1 == 1 && i5 == 0 && i10 == 0)
                begin
                nexts = 3'b000; // starea initiala
                suc = 1;
                end
             if (i1 == 0 && i5 == 1 && i10 == 0)
                begin
                nexts = 3'b011; // 3 lei rest
                suc = 1;
                r1 = 1;
                end
             if (i1 == 0 && i5 == 0 && i10 == 1)
                begin
                nexts = 3'b111; // 4 lei rest
                suc = 1;
                r5 = 1;
                end
        end
        3'b011: // 3 lei rest
        begin
            nexts = 3'b110; // 2 lei rest
            r1 = 1;
        end
        3'b101: // 1 leu rest
        begin
            nexts = 3'b000; 
            r1 = 1;
        end
        3'b110: // 2 lei rest
        begin
            nexts = 3'b101;
            r1 = 1;
        end
        3'b111: // 4 lei rest
        begin
            nexts = 3'b011;
            r1 = 1;
        end
        endcase        
        end

end

endmodule