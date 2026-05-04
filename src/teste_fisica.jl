using Plots

function calcular_posicao(s0, v0, t)
    return s0 + v0 * t
end

function main()
    s0 = 1.0
    v0 = 1.0
    t_final = 10

    # Definindo os tipos dos vetores (melhor performance)
    time = Float64[]
    position = Float64[]
    
    println("--- Iniciando Simulação ---")
    
    for t in 0:t_final
        pos = calcular_posicao(s0, v0, t)
        push!(time, Float64(t))
        push!(position, pos)
    end
    
    # Criamos o gráfico. Note que tirei o '!' para ser o gráfico principal.
    p = plot(time, position, 
            seriestype=:scatter, 
            title="Movimento Linear",
            xlabel="Tempo (s)", 
            ylabel="Posição (m)",
            label="Dados da Simulação",
            marker=:circle)
             
    display(p) # Garante que o gráfico apareça no VS Code
    println("--- Simulação Finalizada ---")
end

main()