library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity axis_packetizer is
    Generic ( PACKET_SIZE : integer := 1024 );
    Port (
        clk           : in  STD_LOGIC;
        reset_n       : in  STD_LOGIC;
        -- Input from XADC (16-bit)
        s_axis_tdata  : in  STD_LOGIC_VECTOR(15 downto 0);
        s_axis_tvalid : in  STD_LOGIC;
        s_axis_tready : out STD_LOGIC;
        -- Output to DMA (32-bit)
        m_axis_tdata  : out STD_LOGIC_VECTOR(31 downto 0);
        m_axis_tvalid : out STD_LOGIC;
        m_axis_tlast  : out STD_LOGIC;
        m_axis_tready : in  STD_LOGIC
    );
end axis_packetizer;

architecture Behavioral of axis_packetizer is
    signal count : unsigned(15 downto 0) := (others => '0');
begin
    -- Transparent ready signal
    s_axis_tready <= m_axis_tready;

    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                count <= (others => '0');
                m_axis_tvalid <= '0';
                m_axis_tlast  <= '0';
            else
                m_axis_tvalid <= s_axis_tvalid;
                -- Physics: Zero-extend 16-bit ADC to 32-bit DMA word
                m_axis_tdata  <= x"0000" & s_axis_tdata;
                
                if s_axis_tvalid = '1' and m_axis_tready = '1' then
                    if count = to_unsigned(PACKET_SIZE - 1, 16) then
                        m_axis_tlast <= '1';
                        count <= (others => '0');
                    else
                        m_axis_tlast <= '0';
                        count <= count + 1;
                    end if;
                else
                    m_axis_tlast <= '0';
                end if;
            end if;
        end if;
    end process;
end Behavioral;