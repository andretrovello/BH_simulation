using Plots

function calcular_posicao(s0, v0, t)
    return s0 + v0 * t
end

function main()
    s0 = 0.0
    v0 = 1.0
    t_final = 20
    dt = 0.5  # Passo de tempo menor para a animação ficar fluida

    println("--- Gerando Animação ---")

    # A macro @animate captura cada plot gerado dentro do loop
    anim = @animate for t in 0:dt:t_final
        pos = calcular_posicao(s0, v0, t)

        # Criamos o gráfico da "bola"
        # x = pos, y = 0 (ela se move apenas no eixo x)
        scatter([pos], [0], 
                xlims=(0, 25),      # Fixamos os limites para a tela não "pular"
                ylims=(-1, 1), 
                label="Objeto",
                markersize=10, 
                markercolor=:blue,
                title="Tempo: $t s",
                aspect_ratio=:equal)
    end

    # Salva o resultado como um arquivo GIF
    gif(anim, "movimento_bola.gif", fps = 20)
    println("--- Concluído: movimento_bola.gif criado! ---")
end

main()