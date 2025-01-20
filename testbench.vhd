library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavior of testbench is
    signal clk, rst: std_logic := '0';  -- Sinais de clock e reset
    signal some_signal: std_logic_vector(31 downto 0);  -- Sinal de exemplo

    -- Instanciando o componente design
    component design
        port (
            clk: in std_logic;
            rst: in std_logic
            -- Adicione os outros portos do componente design conforme necessário
        );
    end component;

begin
    -- Instanciando o componente design
    uut: design port map (
        clk => clk,
        rst => rst
        -- Conecte os outros portos conforme necessário
    );

    -- Processo de simulação do clock
    process
    begin
        while now < 100 ns loop  -- Simule por 100ns (ajuste conforme necessário)
            clk <= '0';
            wait for 5 ns;  -- Período de clock de 10 ns (ajuste conforme necessário)
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Processo de reset
    process
    begin
        rst <= '1';
        wait for 20 ns;  -- Mantenha o reset ativo por um período
        rst <= '0';  -- Desative o reset
        wait;
    end process;

    -- Processo de teste
    process
    begin
        -- Adicione estímulos de entrada aqui
        -- Exemplo: some_signal <= "00110011001100110011001100110011";  -- Valor de 32 bits

        -- Aguarde um tempo para observar a saída
        wait for 50 ns;

        -- Adicione verificações de saída aqui
        -- Exemplo: assert (alguma_condição) report "Falha no teste" severity failure;

        wait;
    end process;

end behavior;
