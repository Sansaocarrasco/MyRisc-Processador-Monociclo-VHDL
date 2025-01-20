----------------------------------
-- Testbench myCPU              --
-- Prof. Max Santana  (2023)    --
-- CEComp/Univasf               --
----------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity testbench2 is
end entity testbench2;

architecture tb of testbench2 is
  signal clock, reset : std_logic := '0';
  constant clock_period : time := 10 ns;
  
begin
  MyRiscMonocycle: entity work.design port map (
    clk => clock,
    rst => reset
  );
    
  clock_process :process
  begin
    for i in 0 to 6 loop
      Clock <= '0';
      wait for clock_period/2;
      Clock <= '1';
      wait for clock_period/2;
	end loop;
    wait;
  end process;
  
  process
  begin    
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    wait for 10 ns;
    reset <= '1';
    wait for 10 ns;
	wait;
  end process;
  
end architecture tb;