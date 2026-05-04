using DifferentialEquations, Plots

# 1. Defina suas funções lógicas separadamente
function calcular_posicao(s0, v0, t)
    return s0 + v0 * t
end

# 2. Crie a função principal para controlar o fluxo
function main()
    # Definindo constantes locais (muito mais rápido que globais)
    s0 = 1.0
    v0 = 1.0
    t_final = 10
    
    println("--- Iniciando Simulação ---")
    
    # O loop agora não precisa da palavra 'global'
    for t in 0:t_final
        pos = calcular_posicao(s0, v0, t)
        println("Tempo: $t s | Posição: $pos m")
    end
    
    println("--- Simulação Finalizada ---")
end

# 3. Chame a função para executar
main()

