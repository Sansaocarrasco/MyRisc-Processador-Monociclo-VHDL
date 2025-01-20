----------------------------------------------------------
-- Design												--
-- myRISC												--
--														--
-- Prof. Max Santana (2023)								--
-- CEComp/Univasf										--
----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity design is
	port(
      clk		 : in std_logic;
      rst		 : in std_logic
    );
end design;

architecture behavior of design is

	signal WirePCPlus4,
    WireInst, 
    WireWriteData,
    WireJumpAddr,
    WireRD1,
    WireRD2,
    WireResult, 
    WireBranchAddr,
    WireImm,
    WireAddress,
    WireMemoryData : std_logic_vector(31 downto 0); 
    
    signal Wireclk,
    Wirerst,
    WireBNE,
    WireBRANCH,
    WireZero,
    WireMEMWRITE,
    WireALUSRC, WireJr,
    WireREGWRITE,
    WireJal	: std_logic;

    signal WireOP,
    WireFUNCT: std_logic_vector(5 downto 0);
    
    signal WireALUOP,
    WireJUMP,
    WireREGDST,
    WireMEMTOREG : std_logic_vector (1 downto 0);
begin
	process(clk, rst)
    	begin
        Wireclk <= clk;
        Wirerst <= rst;
    end process;
    
    FETCH: entity work.fetch port map(
    	clk       => Wireclk, 
        rst       => Wirerst,
        bne		  => WireBNE,
        branch    => WireBRANCH,
        jump      => WireJUMP,
        RD1		  => WireRD1,
        zero      => WireZero,
        jumpAddr  => WireJumpAddr,
        branchAddr=> WireBranchAddr,
        PCplus4   => WirePCPlus4,
        inst      => WireInst,
    	jr		  => WireJr
        
    );
    
    CONTROLLER: entity work.control port map(
    	op		 => WireOP,
        regDst	 => WireREGDST,
        jump	 => WireJUMP,
        branch	 => WireBRANCH,
        bne		 => WireBNE,
        memWR	 => WireMEMWRITE,
        memToReg => WireMEMTOREG,
        aluOp	 => WireALUOP,
        aluSrc	 => WireALUSRC,
        regWrite => WireREGWRITE,
        funct	 => WireFUNCT,
        jr		 => WireJr
     
     );
     DECODE: entity work.decode port map(
     	clk        => Wireclk,
        rst        => Wirerst,
        PCplus4    => WirePCPlus4,
        inst       => WireInst,
        writeData  => WireWriteData,
        regDst     => WireREGDST,
        regWrite   => WireREGWRITE,
        opcode     => WireOP,
        jumpAddr   => WireJumpAddr,
        readData1  => WireRD1,
        readData2  => WireRD2,
        imm        => WireImm,
        funct      => WireFUNCT
     );
     EXECUTE: entity work.execute port map(
     	PCplus4    => WirePCPlus4,
        aluSrc     => WireALUSRC,
        readData1  => WireRD1,
        readData2  => WireRD2,
        imm  	   => WireImm,
        funct      => WireFUNCT,
        aluOP	   => WireALUOP,
        zero       => WireZero,
        result     => WireResult,
        branchAddr => WireBranchAddr
     );
     MEMACCESS: entity work.memoryAccess port map(
     	clk		   => Wireclk,
    	address    => WireAddress,
        memToReg   => WireMEMTOREG,
        memWrite   => WireMEMWRITE,
        writeData  => WireWriteData,
        memoryData => WireMemoryData
     );
     WRITEBACK: entity work.writeBack port map(
     	memoryData => WireMemoryData,
        result     => WireResult,
        memToReg   => WireMEMTOREG,
        writeData  => WireWriteData,
        PCplus4	   => WirePCPlus4
     );

end architecture behavior;