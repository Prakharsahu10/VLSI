module FIFObuffer_tb;

    reg Clk;

    reg [31:0] dataIn;

    reg RD;

    reg WR;

    reg EN;

    reg Rst;

    wire [31:0] dataOut;

    wire EMPTY;

    wire FULL;



    FIFObuffer uut (

        .Clk(Clk),

        .dataIn(dataIn),

        .RD(RD),

        .WR(WR),

        .EN(EN),

        .dataOut(dataOut),

        .Rst(Rst),

        .EMPTY(EMPTY),

        .FULL(FULL)

    );



    initial begin

        Clk = 1'b0;

        dataIn = 32'h0;

        RD = 1'b0;

        WR = 1'b0;

        EN = 1'b0;

        Rst = 1'b1;


        #100;

        EN = 1'b1;

        Rst = 1'b1;



        #20;

        Rst = 1'b0;



        WR = 1'b1;

        dataIn = 32'h0;

        #20;

        dataIn = 32'h1;

        #20;

        dataIn = 32'h2;

        #20;

        dataIn = 32'h3;

        #20;

        dataIn = 32'h4;



        #20;

        WR = 1'b0;

        RD = 1'b1;

    end



    always #10 Clk = ~Clk;

endmodule

